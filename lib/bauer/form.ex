defmodule Bauer.Form do
  defstruct [attributes: %{}, fields: %{}]

  alias Bauer.Form

  import Bauer.Node

  def build({"form", _attrs, _children} = node) do
    %Form{
      attributes: attributes(node),
      fields: (node)
    }
  end

end
