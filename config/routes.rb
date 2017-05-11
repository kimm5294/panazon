Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  resources :carts, only: [:show]
  root 'sessions#new'

end
