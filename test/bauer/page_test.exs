defmodule Bauer.PageTest do
  use TestCase

  doctest Bauer.Page

  alias Bauer.Page

  @tag fixture: "simple.html"
  describe "title" do
    test "returns the title", %{page: page} do
      title = Page.title(page)
      assert "Hello, world!" == title
    end
  end

  @tag fixture: "simple.html"
  describe "links" do
    test "parsing links", %{page: page} do
      links = Page.links(page)
      assert ["Homepage", "Google"] == Enum.map(links, &(&1.text))
      assert ["/", "http://google.com"] == Enum.map(links, &(&1.href))
    end
  end

  @tag fixture: "simple.html"
  describe "forms" do
    test "parsing forms", %{page: page} do
      form = Page.forms(page) |> Enum.at(0)
      assert "search"  == form.name
      assert "/search" == form.action
      assert "get"     == form.method
    end
  end
end
