defmodule Back.Monster9Test do
  use Back.ModelCase

  alias Back.Monster9

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster9.changeset(%Monster9{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster9.changeset(%Monster9{}, @invalid_attrs)
    refute changeset.valid?
  end
end
