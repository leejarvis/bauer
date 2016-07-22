# Bauer

Bauer is a high level library for interacting with websites.

It's a work-in-progress, come back another time :-)

[Documentation for Bauer is available online](http://hexdocs.pm/bauer/).

## Installation

  1. Add `bauer` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:bauer, "~> 0.1.0"}]
end
```

## Example

```elixir
defmodule DDG do
  use Bauer

  def search(query) do
    start_browser
    |> open("https://duckduckgo.com")
    |> find_form(id: "search_form_input_homepage")
    |> fill_form(q: query)
    |> submit_form
    |> parse_results
  end

  defp parse_results(%Bauer.Browser{page: page}) do
    page
    |> links
  end
end

results = DDG.search("elixir-lang")
```

## License

Bauer source code is released under Apache 2 License.
Check LICENSE file for more information.
