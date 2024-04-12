#==============================================================
# Alunos: Giancarlo Silveira Cavalcante    - 20220055086
#         Herlan Alef de Lima Nascimento   - 20220096712
#         Messias da Silva Guedes          - 20220006199
#==============================================================
defmodule Myad.MixProject do
  use Mix.Project

  def project do
    [
      app: :myad,
      version: "0.1.0",
      elixir: "~> 1.15",
      start_permanent: Mix.env() == :prod,
      deps: deps(),
      escript: escript()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 2.1"},
	  {:poison, "~> 5.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
  defp escript do
    [
    main_module: Api
    ]
    end
end
