defmodule Back.Monster32Test do
  use Back.ModelCase

  alias Back.Monster32

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster32.changeset(%Monster32{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster32.changeset(%Monster32{}, @invalid_attrs)
    refute changeset.valid?
  end
end
