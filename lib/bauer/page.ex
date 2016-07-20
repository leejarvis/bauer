defmodule Bauer.Page do
  @moduledoc """
  This module provides convenience functions for extracting information
  from a HTML page.
  """

  defstruct [:body]

  alias Bauer.Page

  import Bauer.Finders

  @doc """
  Returns the HTML page title.
  """
  def title(%Page{body: body}) do
    body
    |> find("title")
    |> text()
  end

  @doc """
  Returns a list of `Bauer.Link` structs.
  """
  def links(%Page{body: body}) do
    body
    |> find("a")
    |> Enum.map(&Bauer.Link.build/1)
  end

  @doc """
  Returns a list of `Bauer.Form` structs.
  """
  def forms(%Page{body: body}) do
    body
    |> find("form")
    |> Enum.map(&Bauer.Form.build/1)
  end
end
