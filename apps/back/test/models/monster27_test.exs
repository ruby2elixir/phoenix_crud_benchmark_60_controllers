defmodule Back.Monster27Test do
  use Back.ModelCase

  alias Back.Monster27

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster27.changeset(%Monster27{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster27.changeset(%Monster27{}, @invalid_attrs)
    refute changeset.valid?
  end
end
