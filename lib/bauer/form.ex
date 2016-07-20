defmodule Bauer.Form do
  defstruct [:name, :method, :action]

  import Bauer.Finders

  def build(tag) do
    %Bauer.Form{
      name:   attribute(tag, "name"),
      action: attribute(tag, "action"),
      method: attribute(tag, "method")
    }
  end
end
