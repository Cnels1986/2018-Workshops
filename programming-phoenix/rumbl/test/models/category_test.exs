defmodule Rumbl.CategoryTest do
  use Rumbl.ModelCase

  alias Rumbl.Category

  @valid_attrs %{name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Category.changeset(%Category{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Category.changeset(%Category{}, @invalid_attrs)
    assert changeset.valid?
  end
end
