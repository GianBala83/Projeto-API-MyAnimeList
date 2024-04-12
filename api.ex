#==============================================================
# Alunos: Giancarlo Silveira Cavalcante    - 20220055086
#         Herlan Alef de Lima Nascimento   - 20220096712
#         Messias da Silva Guedes          - 20220006199
#==============================================================
defmodule Api do
  def main(_args) do

    Mal.main
    |> show_info_main

    IO.puts "Deseja pesquisar outro anime?"
    IO.puts "S/N"
    op_end = IO.gets("")
    op_end = String.trim(op_end)
    op_end = String.downcase(op_end)
    if op_end == "s" do
      IO.puts(IO.ANSI.clear())
      a = "vazio"
      main(a)
    else
      IO.puts "Adios!"
    end

  end

  defp show_info_main ({:error, _}) do
    IO.puts "Ocorreu um Erro ao procurar informações sobre esse anime!"
  end

  defp show_info_main ({:ok, b}) do
    {:ok, api_map} = Poison.decode(b)
    list_with_infos = api_map["data"]

    IO.puts "Menu Principal"

    IO.puts "1 - Mostra Todos os animes relacionados em lista"
    IO.puts "2 - Pesquisar um titulo especifico"

    op = IO.gets("")
    op = String.trim(op)

    if op == "1" do
      show_all_info_in_data(list_with_infos)
    end
    if op == "2" do
      IO.puts "Digite a extensão do nome:"
      text = IO.gets("")
      text = String.trim(text)
      show_info_only_if_found(list_with_infos, text)
    end
  end

  defp show_all_info_in_data ([]) do
    nil
  end

  defp show_all_info_in_data([h | t]) do
    show_infos(h)
    show_all_info_in_data(t)
  end

  defp show_info_only_if_found([], _text) do
    nil
  end

  defp show_info_only_if_found([h | t], text) do
    # A função está programada para mostra apenas o primeiro titulo que ela encontrar!
    if String.contains?(h["title"], text) do
      show_infos_more_details(h)
    else
      show_info_only_if_found(t, text)
    end
  end

  defp show_infos(obj)do
    type = obj["type"]
    score = obj["score"]
    rank = obj["rank"]
    day = obj["aired"]["prop"]["from"]["day"]
    month = obj["aired"]["prop"]["from"]["month"]
    year = obj["aired"]["prop"]["from"]["year"]

    IO.puts "\n"
    IO.puts obj["title"]
    IO.puts "     Tipo                : #{type}"
    IO.puts "     Nota no Myanimelist : #{score}"
    IO.puts "     Rank no Myanimelist : #{rank}"
    IO.puts "     Data de Estreia     : #{day}/#{month}/#{year}"
  end

  defp show_infos_more_details(obj)do
    #link = obj["url"] # Pensando em abrir o link
    type = obj["type"]
    status = obj["status"]
    studios_list = hd(obj["studios"])
    studios = studios_list["name"]
    #studios =
    score = obj["score"]
    rank = obj["rank"]
    synopsis = obj["synopsis"]
    day = obj["aired"]["prop"]["from"]["day"]
    month = obj["aired"]["prop"]["from"]["month"]
    year = obj["aired"]["prop"]["from"]["year"]

    IO.puts "\n"
    IO.puts "----------------------------------------------------------"
    IO.puts obj["title"]
    IO.puts "     Tipo                : #{type}"
    IO.puts "     Estado              : #{status}"
    IO.puts "     Estudio             : #{studios}"
    IO.puts "     Nota no Myanimelist : #{score}"
    IO.puts "     Rank no Myanimelist : #{rank}"
    IO.puts "     Data de Estreia     : #{day}/#{month}/#{year}"
    IO.puts "Sinopse:"
    IO.puts "#{synopsis}"
    IO.puts "----------------------------------------------------------"

  end

end
