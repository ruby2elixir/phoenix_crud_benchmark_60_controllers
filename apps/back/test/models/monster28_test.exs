defmodule Back.Monster28Test do
  use Back.ModelCase

  alias Back.Monster28

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster28.changeset(%Monster28{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster28.changeset(%Monster28{}, @invalid_attrs)
    refute changeset.valid?
  end
end
