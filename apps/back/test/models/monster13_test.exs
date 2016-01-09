defmodule Back.Monster13Test do
  use Back.ModelCase

  alias Back.Monster13

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster13.changeset(%Monster13{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster13.changeset(%Monster13{}, @invalid_attrs)
    refute changeset.valid?
  end
end
