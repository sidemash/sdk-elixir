defmodule SidemashSdk.MixProject do
  use Mix.Project

  def project do
    [
      app: :sidemash_sdk,
      version: "0.1.0",
      elixir: "~> 1.10",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      description: description(),
      package: package(),
      name: "sidemash_sdk",
      source_url: "https://github.com/sidemash/sdk-elixir",
      homepage_url: "http://developers.sidemash.com/docs/v1.0/sdk/elixir",
      docs: [
        main: "sidemash_sdk",
        logo: "logo.png",
        extras: ["README.md"]
      ]
    ]
  end

  def application do
    [
      extra_applications: [:logger, :crypto, :inets]
    ]
  end

  defp description() do
    "The official Sidemash Cloud SDK for Elixir."
  end

  defp deps do
    [
      {:poison, "~> 3.1"},
      {:ex_doc, "~> 0.23", only: :dev, runtime: false}
    ]
  end

  defp package() do
    [
      licenses: ["Apache-2.0"],
      links: %{"GitHub" => "https://github.com/sidemash/sdk-elixir"}
    ]
  end
end
