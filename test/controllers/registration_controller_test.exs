defmodule Fishbowl.RegistrationControllerTest do
  use Fishbowl.ConnCase

  alias Fishbowl.User

  @valid_attrs %{email: "michaeljordan@test.com", password: "passw0rd", password_confirmation: "passw0rd", name: "Michael"}
  @invalid_attrs %{email: "lebronjames@test.com"}

  test "creates resource when data is valid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), user: @valid_attrs
    assert Repo.get_by(User, email: "michaeljordan@test.com")
  end

  test "does not create resource when data is invalid", %{conn: conn} do
    conn = post conn, registration_path(conn, :create), user: @invalid_attrs
    refute Repo.get_by(User, email: "lebronjames@test.com")
  end
end
