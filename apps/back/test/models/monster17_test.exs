defmodule Back.Monster17Test do
  use Back.ModelCase

  alias Back.Monster17

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster17.changeset(%Monster17{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster17.changeset(%Monster17{}, @invalid_attrs)
    refute changeset.valid?
  end
end
