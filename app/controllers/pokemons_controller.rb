require "httparty"

class PokemonsController < ApplicationController
  def index
  end

  def search
    begin
      base_url = "https://pokeapi.co/api/v2/pokemon/#{params[:query]}"
      response = HTTParty.get(base_url)
      if response.code == 200
        @pokemon = response.parsed_response
      else
        flash[:alert] = "ポケモンが見つかりませんでした"
        redirect_to root_path
      end
      puts response.body
    rescue => e
      puts "エラーが発生しました: #{e.message}"
    end
  end
end
