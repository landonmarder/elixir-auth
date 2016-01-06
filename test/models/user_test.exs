defmodule Fishbowl.UserTest do
  use Fishbowl.ModelCase

  alias Fishbowl.User

  @valid_attrs %{email: "michaeljordan@test.com", password: "passw0rd", password_confirmation: "passw0rd", name: "Michael"}
  @not_matching_passwords %{email: "michaeljordan@test.com", password: "passw0rd123", password_confirmation: "passw0rd", name: "Michael"}
  @not_valid_email %{email: "michaeljordan", password: "passw0rd", password_confirmation: "passw0rd", name: "Michael"}
  @no_name %{email: "michaeljordan@test.com", password: "passw0rd", password_confirmation: "passw0rd"}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes - not matching passwords" do
    changeset = User.changeset(%User{}, @not_matching_passwords)
    refute changeset.valid?
  end

  test "changeset with invalid attributes - not valid email" do
    changeset = User.changeset(%User{}, @not_valid_email)
    refute changeset.valid?
  end

  test "changeset with invalid attributes - no name" do
    changeset = User.changeset(%User{}, @no_name)
    refute changeset.valid?
  end
end
