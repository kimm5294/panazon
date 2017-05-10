Rails.application.routes.draw do

  resources :categories, only: [:index, :show] do
    resources :items, except: [:index]
  end
end
