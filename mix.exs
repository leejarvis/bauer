defmodule Bauer.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :bauer,
     version: @version,
     elixirc_paths: elixirc_paths(Mix.env),
     name: "Bauer",
     source_url: "https://github.com/leejarvis/bauer",
     homepage_url: "https://github.com/leejarvis/bauer",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     docs: docs(),
     description: "Functional web browsing",
     package: package(),
   ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    [applications: [:logger]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_),     do: ["lib"]

  # Dependencies can be Hex packages:
  #
  #   {:mydep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:mydep, git: "https://github.com/elixir-lang/mydep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options
  defp deps do
    [
      {:floki, "~> 0.9.0"},
      {:ex_doc, "~> 0.12", only: :dev},
      {:exvcr, "~> 0.7", only: :test},
      {:httpoison, "~> 0.9.0"}
    ]
  end

  defp docs do
    [extras: ["README.md"], main: "readme"]
  end

  defp package do
    [licenses: ["Apache 2"],
      links: %{"GitHub" => "https://github.com/leejarvis/bauer"}]
  end

end
