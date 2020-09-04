

Rails.application.routes.draw do
  root "sell_goods#index"
  #resources :sell_goods, onry: [:index]

  # root "users#new"

  devise_for :users
  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :sell_goods
end
