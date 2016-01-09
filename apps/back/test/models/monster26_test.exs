defmodule Back.Monster26Test do
  use Back.ModelCase

  alias Back.Monster26

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster26.changeset(%Monster26{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster26.changeset(%Monster26{}, @invalid_attrs)
    refute changeset.valid?
  end
end
