defmodule Back.Monster1Test do
  use Back.ModelCase

  alias Back.Monster1

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster1.changeset(%Monster1{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster1.changeset(%Monster1{}, @invalid_attrs)
    refute changeset.valid?
  end
end
