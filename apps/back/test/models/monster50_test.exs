defmodule Back.Monster50Test do
  use Back.ModelCase

  alias Back.Monster50

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster50.changeset(%Monster50{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster50.changeset(%Monster50{}, @invalid_attrs)
    refute changeset.valid?
  end
end
