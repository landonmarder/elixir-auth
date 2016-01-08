defmodule Fishbowl.SessionController do
  use Fishbowl.Web, :controller

  plug :scrub_params, "user" when action in [:create]
  plug :action

  def new(conn, _params) do
    render(conn, changeset: User.changeset(%User{}))
  end

  def create(conn, %{"user" => user_params}) do
    user = if is_nil(user_params["email"]) do
      nil
    else
      Repo.get_by(User, email: String.downcase(user_params["email"]))
    end

    if is_nil(user) do
      conn
        |> put_flash(:error, 'Could not find a user with that email.')
        |> render("new.html", changeset: User.changeset(%User{}))
    else
      IEx.pry
      cond do
        Comeonin.Bcrypt.checkpw(user_params["password"], user.encrypted_password) ->
          conn
            |> put_session(:current_user, user)
            |> put_flash(:info, 'You are now signed in.')
            |> redirect(to: page_path(conn, :index))
        true ->
          conn
            |> put_flash(:error, 'Email or password are incorrect.')
            |> render("new.html", changeset: User.changeset(%User{}))
      end
    end
  end

  def delete(conn, _) do
    delete_session(conn, :current_user)
      |> put_flash(:info, 'You have been logged out')
      |> redirect(to: session_path(conn, :new))
  end
end
