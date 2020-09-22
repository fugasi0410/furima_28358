

Rails.application.routes.draw do
  devise_for :sell_goods
  root "sell_goods#index"
  resources :sell_goods,only: [:update]

  devise_for :users
  #root "users#new"
  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sell_goods
  resources :sell_goods, only: :index
end
