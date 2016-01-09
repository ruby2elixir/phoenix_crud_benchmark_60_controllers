defmodule Back.Monster40Test do
  use Back.ModelCase

  alias Back.Monster40

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster40.changeset(%Monster40{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster40.changeset(%Monster40{}, @invalid_attrs)
    refute changeset.valid?
  end
end
