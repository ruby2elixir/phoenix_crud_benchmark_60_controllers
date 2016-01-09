defmodule Back.Monster55Test do
  use Back.ModelCase

  alias Back.Monster55

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster55.changeset(%Monster55{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster55.changeset(%Monster55{}, @invalid_attrs)
    refute changeset.valid?
  end
end
