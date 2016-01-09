defmodule Back.Monster23Test do
  use Back.ModelCase

  alias Back.Monster23

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster23.changeset(%Monster23{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster23.changeset(%Monster23{}, @invalid_attrs)
    refute changeset.valid?
  end
end