defmodule Back.Monster6Test do
  use Back.ModelCase

  alias Back.Monster6

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster6.changeset(%Monster6{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster6.changeset(%Monster6{}, @invalid_attrs)
    refute changeset.valid?
  end
end
