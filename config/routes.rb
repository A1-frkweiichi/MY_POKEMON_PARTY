Rails.application.routes.draw do
  root "pokemons#index"
  post "pokemons/search", to: "pokemons#search", as: "search_pokemons"
end
