defmodule Back.Monster34Test do
  use Back.ModelCase

  alias Back.Monster34

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster34.changeset(%Monster34{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster34.changeset(%Monster34{}, @invalid_attrs)
    refute changeset.valid?
  end
end
