Rails.application.routes.draw do
  root 'homepage#index'


  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end


  resources :users

  post 'import/items' => 'items#import' do
    collection { post :import }
  end

  resources :users do
    resources :transactions, only: [:destroy, :create]
  end
  get "/users/:id/cart" => "users#cart"

  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'

  get '/csv_example' => 'application#csv_example'

end
