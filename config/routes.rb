Rails.application.routes.draw do
  
  resources :videos
  resources :countries
  get '/countries' => 'countries#index'
  post '/countries' => 'countries#create'
  get '/players' => 'players#index'

  post '/players' => 'players#index'
  
  get '/players/new' => 'players#new'
  post '/players/new' => 'players#create'

  get '/players/:slug' => 'players#show'

  get '/players/:slug/edit' => 'players#edit'

  post '/players/:slug/edit' => 'players#update'

  get '/players/:slug/delete' => 'players#destroy'

  #post '/players/:slug/delete' => 'players#destroy'  (not necessary)

  get '/players/:slug/videos/new' => 'videos#new'

  post '/players/:slug/videos/new' => 'videos#create'
  
  
  resources :players, only: [:show] do
    resources :videos, only: [:new]
    resources :matches, only: [:show, :new]
  #players/petra-kvitova/matches/2017-wimbledon-vs-azarenka
  end
  
end
