Rails.application.routes.draw do
  root 'homepage#index'

  resources :categories, only: [:index, :show]
  resources :connections, only: [:create, :destroy]
  resources :items, except: [:index]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users do
    resources :transactions, only: [:destroy, :create, :update]
    get "/friends" => "users#friends"
  end

  get "/users/:id/cart" => "users#cart"
  get '/csv_example' => 'application#csv_example'

  post 'import/items' => 'items#import' do
    collection { post :import }
  end

  post "/users/:id/checkout" => 'users#checkout'
  post "/users/:id/clear_cart" => 'users#clear_cart'

  get "/search" => 'users#search'
end
