defmodule Bauer.Browser do
  defstruct [
    current: [address: nil],
    page: nil,
    started?: false,
    history: [],
  ]

  alias Bauer.{Browser, Page}
  import Bauer.Node

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

  def click_link(%Browser{page: page} = browser, link_text) do
    link = case Enum.find(Page.links(page), &(text(&1) == link_text)) do
      node -> attribute(node, "href")
      nil -> nil
    end

    url = case link do
      "/" <> _ ->
        URI.parse(get_current(browser, :address))
        |> Map.put(:path, link)
        |> URI.to_string
      _ ->
        nil
    end

    case url do
      nil -> browser
      _ -> open(browser, url)
    end
  end

  def page_title(%Browser{page: page}) do
    Page.title(page)
  end

  defp open_page(%Browser{} = browser, url, page) do
    browser
    |> put_current(:address, url)
    |> put_page(page)
  end

  def put_current(browser, key, value) do
    %{browser | current: Keyword.put(browser.current, key, value)}
  end

  def get_current(browser, key) do
    Keyword.get(browser.current, key)
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
