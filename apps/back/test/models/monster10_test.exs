defmodule Back.Monster10Test do
  use Back.ModelCase

  alias Back.Monster10

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster10.changeset(%Monster10{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster10.changeset(%Monster10{}, @invalid_attrs)
    refute changeset.valid?
  end
end
