defmodule Back.Monster56Test do
  use Back.ModelCase

  alias Back.Monster56

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster56.changeset(%Monster56{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster56.changeset(%Monster56{}, @invalid_attrs)
    refute changeset.valid?
  end
end
