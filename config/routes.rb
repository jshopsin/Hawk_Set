Rails.application.routes.draw do
  root to: "welcome#index"

  devise_for :users

  resources :users, only: [:show]
  resources :games, only: [:show, :create]

  resources :games, only: [] do
    resources :card_sets, only: [:create]
    resources :assignments, only: [:update]
    post 'check_board', to: 'games#check_board'
  end

end
