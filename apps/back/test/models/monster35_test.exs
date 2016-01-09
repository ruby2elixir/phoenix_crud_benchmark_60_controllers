defmodule Back.Monster35Test do
  use Back.ModelCase

  alias Back.Monster35

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster35.changeset(%Monster35{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster35.changeset(%Monster35{}, @invalid_attrs)
    refute changeset.valid?
  end
end
