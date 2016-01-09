defmodule Back.Monster3Test do
  use Back.ModelCase

  alias Back.Monster3

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster3.changeset(%Monster3{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster3.changeset(%Monster3{}, @invalid_attrs)
    refute changeset.valid?
  end
end
