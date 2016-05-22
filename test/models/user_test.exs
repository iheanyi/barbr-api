defmodule Barbr.UserTest do
  use Barbr.ModelCase

  alias Barbr.User

  @valid_attrs %{email: "user@example.com", password: "thisisatesting",
    username: "testuser"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
