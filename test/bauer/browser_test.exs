defmodule Bauer.BrowserTest do
  use TestCase

  alias Bauer.Browser
  alias Bauer.Page

  test "basic request" do
    page = %Browser{}
    |> Browser.get("http://localhost:4000/simple")

    assert "Hello, world!" == Page.title(page)
  end
end
