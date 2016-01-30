defmodule Fishbowl.UserGroup do
  use Fishbowl.Web, :model

  schema "user_groups" do
    belongs_to :user, Fishbowl.User
    belongs_to :group, Fishbowl.Group

    timestamps
  end

  @required_fields ~w(user_id group_id)
  @optional_fields ~w()

  @doc """
  Creates a changeset based on the `model` and `params`.

  If no params are provided, an invalid changeset is returned
  with no validation performed.
  """
  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
