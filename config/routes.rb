Rails.application.routes.draw do
  devise_for :users

  root to: 'home#index'

  resources :warehouses, only: [:show, :new, :create, :edit, :update] do
    post 'product_entry', on: :member
    get 'search', on: :collection, to: 'warehouses#search'
    get '/warehouses', to: redirect('/')
  end

  resources :suppliers, only: [:index, :show, :new, :create]

  resources :product_types, only: [:show, :new, :create, :edit, :update] do
    patch :change_status, on: :member
  end

  resources :product_bundles, only: [:show, :new, :create]

  resources :product_categories, only: [:index, :show, :new, :create]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :warehouses, only: [:index, :show, :create]
      resources :suppliers, only: [:index, :show, :create]
      resources :product_types, only: [:index, :show, :create]
    end
  end
end
