defmodule Back.Monster60Test do
  use Back.ModelCase

  alias Back.Monster60

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster60.changeset(%Monster60{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster60.changeset(%Monster60{}, @invalid_attrs)
    refute changeset.valid?
  end
end
