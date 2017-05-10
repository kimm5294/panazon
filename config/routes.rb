Rails.application.routes.draw do
    resources :products, only: [:index]
    resource :cart, only: [:show]
    resources :order_items, only: [:create, :update, :destroy]
    root "products#index"

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  # root 'sessions#new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
