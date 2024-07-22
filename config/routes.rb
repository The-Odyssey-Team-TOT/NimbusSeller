Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"

  get 'up' => 'rails/health#show', as: :rails_health_check

  resources :shops, only: [:index, :new, :show, :create, :destroy]

  resources :orders, only: [:index, :show]

  resources :products
end
