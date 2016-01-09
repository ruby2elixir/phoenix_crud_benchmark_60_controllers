defmodule Back.Monster53Test do
  use Back.ModelCase

  alias Back.Monster53

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster53.changeset(%Monster53{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster53.changeset(%Monster53{}, @invalid_attrs)
    refute changeset.valid?
  end
end
