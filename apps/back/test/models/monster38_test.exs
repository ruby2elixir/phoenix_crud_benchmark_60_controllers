defmodule Back.Monster38Test do
  use Back.ModelCase

  alias Back.Monster38

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster38.changeset(%Monster38{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster38.changeset(%Monster38{}, @invalid_attrs)
    refute changeset.valid?
  end
end
