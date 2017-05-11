Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end

  post 'import/items' => 'items#import' do
    collection { post :import }
  end

  resources :connections, only: [:create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  get "/users/:id/cart" => "users#cart"

  root 'sessions#new'

  get '/csv_example' => 'application#csv_example'

end
