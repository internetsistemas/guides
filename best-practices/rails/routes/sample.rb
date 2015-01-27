Rails.application.routes.draw do

  root 'home#index'

  resources :products
  resources :users, only: [:index, :show]

  post 'product/:id/buy', to: 'products#buy', as: :buy_product

  get  'products/:slug', to: 'products#slug', as: :product_by_slug
end

