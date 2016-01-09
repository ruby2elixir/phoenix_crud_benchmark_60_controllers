defmodule Back.Monster37Test do
  use Back.ModelCase

  alias Back.Monster37

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster37.changeset(%Monster37{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster37.changeset(%Monster37{}, @invalid_attrs)
    refute changeset.valid?
  end
end
