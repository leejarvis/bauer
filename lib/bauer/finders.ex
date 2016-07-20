defmodule Bauer.Finders do
  def find(html, tag) do
    Floki.find(html, tag)
  end

  def text(tag) do
    Floki.text(tag)
  end

  @doc """
  Returns the HTML attribute for `attribute_name`
  as a list if there are multiple attributes, or a string
  if there's only one

  ## Example

      iex> Bauer.Finders.attribute("<a href='/foo'>Hello</a>", "href")
      "/foo"

  """
  def attribute(tag, attribute_name) do
    case Floki.attribute(tag, attribute_name) do
      [one] -> one
      more  -> more
    end
  end
end
