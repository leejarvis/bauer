defmodule Bauer.Page do
  @moduledoc """
  This module provides convenience functions for extracting information
  from a HTML page.

  ## Examples

      iex> %Bauer.Page{body: html} |> Bauer.Page.title() #=> "Hello, world!"
  """

  defstruct [:body]

  alias Bauer.Page

  import Bauer.Finders

  @doc """
  Returns the HTML page title
  """
  def title(%Page{body: body}) do
    body
    |> find("title")
    |> text()
  end
end
