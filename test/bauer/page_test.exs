defmodule Bauer.PageTest do
  use ExUnit.Case, async: true
  doctest Bauer.Page

  alias Bauer.Page

  @body """
    <html>
    <head><title>Hello, world!</title></head>
    <body><h1>Hello, world!</h1></body>
    </html>
  """

  setup(tags) do
    page = %Page{body: @body}
    tags = Map.put(tags, :page, page)
    {:ok, tags}
  end

  describe "title" do
    test "returns the title", %{page: page} do
      title = Page.title(page)
      assert "Hello, world!" == title
    end
  end
end