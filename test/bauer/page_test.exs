defmodule Bauer.PageTest do
  use TestCase

  doctest Bauer.Page

  alias Bauer.{Page, Node}

  setup(tags) do
    html = Fixtures.html("simple.html")
    tags = Map.put(tags, :page, %Bauer.Page{body: html})

    {:ok, tags}
  end

  describe "title" do
    test "returns the title", %{page: page} do
      title = Page.title(page)
      assert "Hello, world!" == title
    end
  end

  describe "links" do
    test "parsing links", %{page: page} do
      links = Page.links(page)
      assert ["Homepage", "Google"] == Enum.map(links, &Node.text/1)
    end
  end

  describe "forms" do
    test "parsing forms", %{page: page} do
      forms = Page.forms(page)
      assert 1 == Enum.count(forms)
    end

    test "finding forms", %{page: page} do
      assert Page.find_form(page, "search")
      assert Page.find_form(page, method: "get", id: "search")
      assert Page.find_form(page, %{"method" => "get", "id" => "search"})

      refute Page.find_form(page, "missing")
      refute Page.find_form(page, method: "post")
    end
  end
end
