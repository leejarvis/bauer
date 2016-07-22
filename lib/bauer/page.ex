defmodule Bauer.Page do
  @moduledoc """
  This module provides convenience functions for extracting information
  from a HTML page.
  """

  defstruct [:body]

  alias Bauer.Page

  import Bauer.Node

  @doc """
  Returns the HTML page title.
  """
  def title(%Page{body: body}) do
    body
    |> find("title")
    |> text()
  end

  @doc """
  Returns a list of page links as tuples.
  """
  def links(%Page{body: body}) do
    body
    |> search("a")
  end

  @doc """
  Returns a list of forms as tuples.
  """
  def forms(%Page{body: body}) do
    body
    |> search("form")
  end

  def find_form(%Page{} = page, name) when is_binary(name) do
    find_form(page, name: name)
  end

  def find_form(%Page{body: body}, attrs) do
    query = for {k, v} <- attrs, into: "", do: "[#{k}=#{v}]"
    body
    |> find("form#{query}")
  end
end
