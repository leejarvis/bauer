defmodule TestCase do
  use ExUnit.CaseTemplate

  setup(tags) do
    case tags do
      %{fixture: fixture} ->
        html = Fixtures.html(fixture)
        {:ok, Map.put(tags, :page, %Bauer.Page{body: html})}
      _ ->
        {:ok, tags}
    end
  end
end
