Rails.application.routes.draw do
  root 'home#index'

  resource :products do
    get :buy, on: :member
    get :slug, on: :member
  end

  resources :users, only: [:index, :show]
end

