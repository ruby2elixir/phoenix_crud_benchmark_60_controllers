defmodule Back.Monster51Test do
  use Back.ModelCase

  alias Back.Monster51

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster51.changeset(%Monster51{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster51.changeset(%Monster51{}, @invalid_attrs)
    refute changeset.valid?
  end
end
