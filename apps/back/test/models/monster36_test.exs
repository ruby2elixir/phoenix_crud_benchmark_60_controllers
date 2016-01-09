defmodule Back.Monster36Test do
  use Back.ModelCase

  alias Back.Monster36

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster36.changeset(%Monster36{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster36.changeset(%Monster36{}, @invalid_attrs)
    refute changeset.valid?
  end
end
