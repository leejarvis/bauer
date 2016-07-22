defmodule Bauer.NodeTest do
  use TestCase

  alias Bauer.Node

  doctest Bauer.Node

  @html """
  <div id="container">
    <header id="title">
      <h1>Hello, World!</h1>
      <p>Lorem ipsum</p>
    </header>
    <div class="content">
      <p>Some <strong>interesting</strong> text</p>
    </div>
  </div>
  """ |> String.replace(~r/\n\s*/, "")

  setup(tags) do
    {:ok, Map.put(tags, :node, Node.parse(@html))}
  end

  test "attribute/2", %{node: node} do
    assert "container" == Node.attribute(node, "id")
    assert nil == Node.attribute(node, "foo")
  end

  test "find/2", %{node: node} do
    assert Node.find(node, ".content")
    refute Node.find(node, ".zomg")
  end

  test "search/2", %{node: node} do
    paragraphs = Node.search(node, "p")
    assert 2 == Enum.count(paragraphs)
  end

  test "tag/1", %{node: node} do
    assert "header" == Node.find(node, "#title") |> Node.tag()
  end

  test "text/1", %{node: node} do
    assert "interesting" == Node.find(node, "strong") |> Node.text()
    assert nil == Node.find(node, "omg") |> Node.text()
  end

  test "to_html/1", %{node: node} do
    assert @html == Node.to_html(node)
  end
end
