defmodule Bauer.Browser do
  defstruct []

  alias Bauer.{Browser, Page}

  def get(%Browser{} = browser, url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{body: body}} ->
        %Page{body: body}
    end
  end
end
