defmodule Fishbowl.User do
  use Fishbowl.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true
    has_many :user_groups, Fishbowl.UserGroup

    timestamps
  end

  @required_fields ~w(name email password password_confirmation)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> update_change(:email, &String.downcase/1)
    |> validate_length(:password, min: 6)
    |> validate_length(:password_confirmation, min: 6)
    |> validate_confirmation(:password)
  end
end
