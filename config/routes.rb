Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  resources :warehouses, only: [:show, :new, :create]
  get '/warehouses', to: redirect('/')

  resources :suppliers, only: [:index, :show, :new, :create]

  resources :product_types, only:[:show, :new, :create]

  resources :product_bundles, only: [:show, :new, :create]
end
