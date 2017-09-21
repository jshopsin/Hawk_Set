Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users

  resources :users, only: [:show]
  resources :games, only: [:show, :create]

end
