defmodule Bauer.FormTest do
  use TestCase
  alias Bauer.{Form, Node}
  doctest Form

  setup(tags) do
    html = Fixtures.html("complex_form.html")
    form = html |> Node.find("form") |> Form.build
    tags = Map.put(tags, :form, form)
    {:ok, tags}
  end

  test "build/1", %{form: form} do
    assert "movieForm" == form.attributes["id"]
  end
end
