defmodule Bauer.BrowserTest do
  use ExUnit.Case, async: false
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  alias Bauer.Browser
  alias Bauer.Page

  setup_all do
    HTTPoison.start
    ExVCR.Config.cassette_library_dir("spec/fixtures/http")
  end

  test "basic request" do
    use_cassette "example_basic_get" do
      title = %Browser{}
      |> Browser.get("http://httpbin.org")
      |> Page.title

      assert title =~ "httpbin"
    end
  end
end
