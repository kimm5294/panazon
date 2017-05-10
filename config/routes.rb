Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end

  get 'import/items' => 'items#import' do
    collection { post :import }
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'

  get '/csv_example' => 'application#csv_example'

end
