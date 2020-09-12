Rails.application.routes.draw do
  
  get '/players' => 'players#index'
  
  
  resources :players, only: [:show] do
    resources :strokes, only: [:show, :new]
  #players/petra-kvitova/strokes/forehand
  end
  
end
