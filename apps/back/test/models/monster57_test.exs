defmodule Back.Monster57Test do
  use Back.ModelCase

  alias Back.Monster57

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster57.changeset(%Monster57{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster57.changeset(%Monster57{}, @invalid_attrs)
    refute changeset.valid?
  end
end
