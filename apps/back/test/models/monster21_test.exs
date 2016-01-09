defmodule Back.Monster21Test do
  use Back.ModelCase

  alias Back.Monster21

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Monster21.changeset(%Monster21{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Monster21.changeset(%Monster21{}, @invalid_attrs)
    refute changeset.valid?
  end
end
