defmodule Bauer.Node do
  @moduledoc """
  This module is designed to encapsulate information about a HTML
  node: the tag name, attributes, and children nodes.

  Currently `Bauer.Node` is just a convenience struct for tuples
  return by `Floki`. This should be the only place `Floki` is used.
  By design, we should be able to drop in/out alternative adapters
  in the future
  """

  @doc """
  Parse an HTML string.
  """
  def parse(html), do: Floki.parse(html)

  @doc """
  Extract an attribute from a node.

  ## Example

      iex> Node.parse("<div class='content'>...</div>") |> Node.attribute("class")
      "content"

      iex> Node.parse("<div class='content'>...</div>") |> Node.attribute("uhoh")
      nil

  """
  def attribute(node, name) do
    case Floki.attribute(node, name) do
      []     -> nil
      [attr] -> attr
      attrs  -> attrs
    end
  end

  @doc """
  Search for a node using a CSS query.

  ## Examples

      Node.find(node, "#content")
      {"div", [{"id", "content"}] ["..."]}

  Returns the first node found, or `nil` if nothing was found.
  """
  def find(node, query) do
    case Floki.find(node, query) do
      [] -> nil
      [attr | _] -> attr
    end
  end

  @doc """
  Search for nodes using a CSS query.

  ## Examples

      Node.search(node, "a[class='clickme']")
      [{"a", [{"class", "clickme"}], ["..."]},
        {"a", [{"class", "clickme"}], ["..."]}]

  Returns a list of matching nodes.
  """
  def search(node, query), do: Floki.find(node, query)

  @doc """
  Returns the tag name for a node.

  ## Examples

      iex> Node.parse("<section>lorem ipsum</section") |> Node.tag()
      "section"

  """
  def tag({tag, _attrs, _children}), do: tag

  def text(nil), do: nil
  def text(node), do: Floki.text(node)

  @doc """
  Returns the raw HTML for a node.

  ## Examples

      html == Node.parse(html) |> Node.to_html
      true

  """
  def to_html(node), do: Floki.raw_html(node)

  @doc """
  Returns the attributes as a Map.

  ## Examples

      Node.parse("<div id="content"></div>") |> Node.attributes
      %{"id" => "content"}

  """
  def attributes({_tag, attrs, _children}) do
    Enum.into(attrs, %{})
  end
end
