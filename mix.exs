defmodule Nostr.Client.MixProject do
  use Mix.Project

  @version "0.1.0"

  def project do
    [
      # Library
      app: :nostr_client,
      version: @version,

      # Elixir
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),

      # Documentation
      name: "Nostr Client",
      source_url: "https://github.com/Sgiath/nostr-client",
      homepage_url: "https://nostr.sgiath.dev",
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      # TODO: change to hex version once secp256k1 library is published
      {:nostr_lib, github: "Sgiath/nostr-lib"},
      {:gun, "~> 2.0.0-rc.2"},

      # Documentation
      {:ex_doc, "~> 0.29", only: :dev, runtime: false},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:mix_test_watch, "~> 1.1", only: :dev, runtime: false}
    ]
  end

  # Documentation

  defp description do
    "Library which implements Nostr client"
  end

  defp package do
    [
      name: "nostr_client",
      maintainers: ["Sgiath <nostr@sgiath.dev>"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["WTFPL"],
      links: %{
        "GitHub" => "https://github.com/Sgiath/nostr-client",
        "Nostr specs" => "https://github.com/nostr-protocol/nips"
      }
    ]
  end

  defp docs do
    [
      authors: [
        "Sgiath <nostr@sgiath.dev>"
      ],
      main: "overview",
      formatters: ["html"],
      extras: ["README.md"]
    ]
  end
end
