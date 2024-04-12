#==============================================================
# Alunos: Giancarlo Silveira Cavalcante    - 20220055086
#         Herlan Alef de Lima Nascimento   - 20220096712
#         Messias da Silva Guedes          - 20220006199
#==============================================================
defmodule Mal do
	def main do

    IO.puts "================================================"
    IO.puts "            MyAnimeList Repository"
    IO.puts "================================================"
    IO.puts "Digite o nome do anime que deseja pesquisar: "
    IO.puts "Obs: O nome precisa estar correto (Ignorando caracteres Mm)"
    anime_i = IO.gets("")
    IO.puts "\n"
    anime = String.downcase(anime_i)
    anime_s = String.split(anime)
    anime = Enum.join(anime_s, "%20")

    url = "https://api.jikan.moe/v4/anime?q=#{anime}&sfw"

    HTTPoison.get(url)
		|> information_process
	end

	defp information_process ({:ok, %HTTPoison.Response{ status_code: 200, body: b}}) do
    {:ok, b}
	end

	defp information_process ({ :error, r}) do
     {:error, r}
	end

	defp information_process ({:ok, %HTTPoison.Response{ status_code: _, body: b}}) do
    {:erro, b}
	end
end
