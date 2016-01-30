defmodule Fishbowl.UserGroupTest do
  use Fishbowl.ModelCase

  alias Fishbowl.UserGroup

  @valid_attrs %{user_id: "1", group_id: "2"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = UserGroup.changeset(%UserGroup{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = UserGroup.changeset(%UserGroup{}, @invalid_attrs)
    refute changeset.valid?
  end
end
