Rails.application.routes.draw do
  devise_for :users

  root to: "games#index"
  resources :games, only: [:index, :new, :create]
  resources :game_tweets, only: [:index, :create]
end
