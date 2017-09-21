Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users

<<<<<<< HEAD
  resources :users, only: [:show]
  resources :games, only: [:show, :create]
=======

  resources :users, only: [:show] do
    resources :games, only: [:show, :create]

  end

  resources :games, only: [] do
    resources :card_sets, only: [:create]
    resources :assignments, only: [:update]
  end
>>>>>>> 2118504828db9f0714d0f5ad37640ba43154c59f

end
