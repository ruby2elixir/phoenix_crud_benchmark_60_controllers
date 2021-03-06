defmodule Back.Monster58Test do
  use Back.ModelCase

  alias Back.Monster58

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster58.changeset(%Monster58{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster58.changeset(%Monster58{}, @invalid_attrs)
    refute changeset.valid?
  end
end
