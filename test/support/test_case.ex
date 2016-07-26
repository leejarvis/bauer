defmodule TestCase do
  use ExUnit.CaseTemplate

  setup_all do
    HTTPoison.start
    Plug.Adapters.Cowboy.http TestServer, []
    :ok
  end
end
