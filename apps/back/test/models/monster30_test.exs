defmodule Back.Monster30Test do
  use Back.ModelCase

  alias Back.Monster30

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster30.changeset(%Monster30{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster30.changeset(%Monster30{}, @invalid_attrs)
    refute changeset.valid?
  end
end
