defmodule Back.Monster29Test do
  use Back.ModelCase

  alias Back.Monster29

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster29.changeset(%Monster29{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster29.changeset(%Monster29{}, @invalid_attrs)
    refute changeset.valid?
  end
end
