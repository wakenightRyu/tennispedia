Rails.application.routes.draw do
  
  resources :countries
  get '/countries' => 'countries#index'
  post '/countries' => 'countries#create'
  get '/players' => 'players#index'
  
  get '/players/new' => 'players#new'
  post '/players/new' => 'players#create'

  get '/players/:slug' => 'players#show'

  get '/players/:slug/edit' => 'players#edit'

  post '/players/:slug/edit' => 'players#update'

  get '/players/:slug/delete' => 'players#destroy'

  post '/players/:slug/delete' => 'players#destroy'
  
  resources :players, only: [:show] do
    resources :strokes, only: [:show, :new]
  #players/petra-kvitova/strokes/forehand
  end
  
end
