defmodule Bauer.Browser do
  defstruct [
    address: nil,
    page: nil,
    form: nil,
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
    %{browser |
      address: url,
      page: page,
      history: [page | browser.history]
    }
  end

  def get(%Browser{}, url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        %Page{body: body}
    end
  end
end
