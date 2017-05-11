Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end

  resources :users
  get "/users/:id/cart" => "users#cart"
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'

end
