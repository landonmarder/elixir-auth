defmodule Fishbowl.GroupTest do
  use Fishbowl.ModelCase

  alias Fishbowl.Group

  @valid_attrs %{name: "Group"}
  @with_code_attrs %{name: "Group", code: "SecretCode"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Group.changeset(%Group{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Group.changeset(%Group{}, @invalid_attrs)
    refute changeset.valid?
  end

  test "changeset with valid attributes and optional" do
    changeset = Group.changeset(%Group{}, @with_code_attrs)
    assert changeset.valid?
  end
end
