defmodule Bauer.Mixfile do
  use Mix.Project

  @version "0.1.0"

  def project do
    [app: :bauer,
     version: @version,
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
      {:ex_doc, "~> 0.12", only: :dev}
    ]
  end

  defp docs do
    [extras: ["README.md"]]
  end

  defp package do
    [maintainer: ["Lee Jarvis"],
      licenses: ["Apache 2.0"],
      links: %{"GitHub" => "https://github.com/leejarvis/bauer"},
      files: ~w(mix.exs README.md CHANGELOG.md lib)]
  end

end
