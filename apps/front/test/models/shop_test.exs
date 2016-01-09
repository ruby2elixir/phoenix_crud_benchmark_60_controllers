defmodule Front.ShopTest do
  use Front.ModelCase

  alias Front.Shop

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Shop.changeset(%Shop{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Shop.changeset(%Shop{}, @invalid_attrs)
    refute changeset.valid?
  end
end
