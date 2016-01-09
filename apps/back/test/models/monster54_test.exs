defmodule Back.Monster54Test do
  use Back.ModelCase

  alias Back.Monster54

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster54.changeset(%Monster54{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster54.changeset(%Monster54{}, @invalid_attrs)
    refute changeset.valid?
  end
end
