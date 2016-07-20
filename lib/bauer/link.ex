defmodule Bauer.Link do
  defstruct [:text, :href]

  import Bauer.Finders

  def build(tag) do
    %Bauer.Link{
      text: text(tag),
      href: attribute(tag, "href")
    }
  end
end
