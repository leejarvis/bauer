defmodule Bauer.Mixfile do
  use Mix.Project

  def project do
    [app: :bauer,
     version: "0.1.0",
     name: "Bauer",
     source_url: "https://github.com/leejarvis/bauer",
     homepage_url: "https://github.com/leejarvis/bauer",
     elixir: "~> 1.3",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps(),
     docs: docs()
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
end
