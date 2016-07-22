defmodule Bauer.FormTest do
  use TestCase

  doctest Bauer.Form

  alias Bauer.{Page, Form}

  @form """
  <form name="search" action="/search" action="get">
    <input type="text" name="query" />
    <input type="text" name="something" value="foo" />
    <input type="password" name="password" />
    <input type="submit" value="Submit!" />
  </form>
  """

  setup(tags) do
    page = %Page{body: @form}
    [form | _] = page |> Page.forms()
    tags = Map.put(tags, :form, form)
    {:ok, tags}
  end

  test "inputs", %{form: form} do
    assert 4 == Enum.count(form.inputs)
  end

  test "inputs_by_type", %{form: form} do
    inputs = Form.inputs_by_type(form, "text")
    assert 2 == Enum.count(inputs)
  end
end
