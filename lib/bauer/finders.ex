defmodule Bauer.Finders do
  def find(html, tag) do
    Floki.find(html, tag)
  end

  def text(tag) do
    Floki.text(tag)
  end
end
