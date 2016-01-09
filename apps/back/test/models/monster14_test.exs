defmodule Back.Monster14Test do
  use Back.ModelCase

  alias Back.Monster14

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster14.changeset(%Monster14{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster14.changeset(%Monster14{}, @invalid_attrs)
    refute changeset.valid?
  end
end
