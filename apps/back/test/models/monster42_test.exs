defmodule Back.Monster42Test do
  use Back.ModelCase

  alias Back.Monster42

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster42.changeset(%Monster42{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster42.changeset(%Monster42{}, @invalid_attrs)
    refute changeset.valid?
  end
end
