defmodule Back.Monster16Test do
  use Back.ModelCase

  alias Back.Monster16

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster16.changeset(%Monster16{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster16.changeset(%Monster16{}, @invalid_attrs)
    refute changeset.valid?
  end
end
