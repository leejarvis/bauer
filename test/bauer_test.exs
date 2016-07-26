defmodule BauerTest do
  use TestCase

  # This module really just tests Bauer.Browser
  # but it's here to define the API with `use`

  doctest Bauer

  use Bauer

  setup(tags) do
    {:ok, Map.put(tags, :browser, start_browser())}
  end

  test "start_browser", %{browser: browser} do
    assert browser.started?
  end

  test "open", %{browser: browser} do
    browser = open(browser, "http://localhost:4000/simple")
    assert browser.page
  end

  test "history", %{browser: browser} do
    browser = open(browser, "http://localhost:4000/simple")
    browser = open(browser, "http://localhost:4000/simple")

    assert 2 == Enum.count(browser.history)
  end
end
