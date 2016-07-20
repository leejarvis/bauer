ExUnit.start()

defmodule Fixtures do
  def path do
    Path.expand("fixtures", __DIR__)
  end

  def html(filename) do
    Path.join([path(), "html", filename])
    |> File.read!
  end
end
