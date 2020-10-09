Rails.application.routes.draw do
  
  resources :users
  resources :videos
  resources :countries

  get '/signup' => 'users#new'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/status' => 'sessions#status'
  post '/status' => 'sessions#status'
  get '/auth/facebook' => 'sessions#facebook'
  get '/auth/facebook/callback' => 'sessions#facebook'
  post '/users/new' => 'users#create'
  get '/users/:slug' => 'users#show'

  get '/countries' => 'countries#index'
  post '/countries' => 'countries#create'

  post '/players/filter' => 'players#filter'

  post '/players/search' => 'players#search'

  get '/players' => 'players#index'

  post '/players' => 'players#index'
  
  get '/players/new' => 'players#new'
  
  post '/players/new' => 'players#create'

  get '/players/:slug/videos' => 'videos#index'

  get '/players/:slug/matches' => 'matches#index'

  get '/players/:slug/edit' => 'players#edit'

  post '/players/:slug/edit' => 'players#update'

  get '/players/:slug/delete' => 'players#destroy'

  #post '/players/:slug/delete' => 'players#destroy'  (not necessary)

  get '/players/:slug/videos/new' => 'videos#new'

  post '/players/:slug/videos/new' => 'videos#create'

  get '/players/:slug/matches/new' => 'matches#new'

  post '/players/:slug/matches/new' => 'matches#create'

  get '/players/:slug/videos/:id/delete' => 'videos#destroy'

  post '/players/:slug/cancel' => 'videos#cancel'

  get '/players/:slug/videos/:id/edit' => 'videos#edit'

  post '/players/:slug/videos/:id/edit' => 'videos#update'

  get '/players/:slug/videos/:id/favorite' => 'videos#favorite'

  post '/players/:slug/videos/:id/favorite' => 'videos#favorite'

  get '/players/:slug/videos/:id/remove' => 'videos#remove'

  post '/players/:slug/videos/:id/remove' => 'videos#remove'

  post '/players/:slug/videos' => 'players#cancel'

  get '/users/:slug/edit' => 'users#edit'

  post '/users/:slug/edit' => 'users#update'

  post '/users/:slug' => 'users#cancel'

  get '/users/:slug/videos/:id/remove' => 'users#remove'

  post '/users/:slug/videos/:id/remove' => 'users#remove'

  get '/players/:slug/matches' => 'matches#index'

  get '/logout' => 'sessions#destroy'
  post '/logout' => 'sessions#destroy'
  delete '/logout' => 'sessions#destroy'
  
  
  resources :players, only: [:show] do
    resources :matches, only: [:index, :new]
    resources :videos, only: [:index, :new]
    
  #players/petra-kvitova/matches/2017-wimbledon-vs-azarenka
  end
  
end
