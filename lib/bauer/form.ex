defmodule Bauer.Form do
  defstruct [:name, :method, :action, :inputs]

  alias Bauer.Form

  import Bauer.Finders

  def build(tag) do
    %Bauer.Form{
      name:   attribute(tag, "name"),
      action: attribute(tag, "action"),
      method: attribute(tag, "method"),
      inputs: build_inputs(tag),
    }
  end

  def inputs_by_type(%Form{inputs: inputs}, type) do
    Enum.filter(inputs, fn(inp) -> inp.type == type end)
  end

  defp build_inputs(form) do
    find(form, "input")
    |> Enum.map(&Bauer.Form.Input.build/1)
  end
end
