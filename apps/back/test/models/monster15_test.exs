defmodule Back.Monster15Test do
  use Back.ModelCase

  alias Back.Monster15

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster15.changeset(%Monster15{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster15.changeset(%Monster15{}, @invalid_attrs)
    refute changeset.valid?
  end
end
