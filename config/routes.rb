Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :game_sessions, only: [:index, :show, :edit, :update]

  resources :users, only: [:show, :edit, :update]

  namespace :player do
      resources :game_sessions, only: [:index, :show, :edit, :update]
  end

  namespace :creator do
      resources :game_sessions, only: [:index, :new, :create, :edit, :update, :destroy]
  end

  resources :games
end
