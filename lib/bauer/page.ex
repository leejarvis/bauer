defmodule Bauer.Page do
  defstruct [:body]

  alias Bauer.Page

  import Bauer.Finders

  def title(%Page{body: body}) do
    body
    |> find("title")
    |> text()
  end
end
