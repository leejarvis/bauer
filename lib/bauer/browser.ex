defmodule Bauer.Browser do
  defstruct [
    current: [address: nil],
    page: nil,
    started?: false,
    history: [],
  ]

  alias Bauer.{Browser, Page}

  ## API

  def start_browser do
    HTTPoison.start
    %Browser{started?: true}
  end

  def open(%Browser{} = browser, url, _opts \\ []) do
    case get(browser, url) do
      %Page{} = page -> open_page(browser, url, page)
    end
  end

  defp open_page(%Browser{} = browser, url, page) do
    browser
    |> put_current(:address, url)
    |> put_page(page)
  end

  def put_current(browser, key, value) do
    Keyword.put(browser.current, key, value)
    browser
  end

  def put_page(browser, page) do
    %{browser | page: page, history: [page | browser.history]}
  end

  def get(%Browser{}, url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        %Page{body: body}
    end
  end
end
