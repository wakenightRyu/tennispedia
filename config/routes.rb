Rails.application.routes.draw do
  
  resources :countries
  get '/countries' => 'countries#index'
  post '/countries' => 'countries#create'
  get '/players' => 'players#index'
  
  get '/players/new' => 'players#new'
  post '/players/new' => 'players#create'

  get '/players/:slug' => 'players#show'
  
  resources :players, only: [:show] do
    resources :strokes, only: [:show, :new]
  #players/petra-kvitova/strokes/forehand
  end
  
end
