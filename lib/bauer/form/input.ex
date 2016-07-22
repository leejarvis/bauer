defmodule Bauer.Form.Input do
  defstruct [:type, :name, :value]

  alias Bauer.Form.Input

  import Bauer.Finders

  def build(tag) do
    %Input{
      name:  attribute(tag, "name"),
      type:  attribute(tag, "type"),
      value: attribute(tag, "value"),
    }
  end
end
