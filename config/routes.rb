Rails.application.routes.draw do
  root 'homepage#index'


  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end

  resources :users
  resources :sessions, only: [:new, :create, :destroy]
  root 'sessions#new'

end
