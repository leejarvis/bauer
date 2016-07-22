defmodule Bauer do
  defmacro __using__(_opts \\ []) do
    quote do
      import Bauer.Browser
    end
  end
end
