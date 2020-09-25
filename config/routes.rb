

Rails.application.routes.draw do
  devise_for :users
  root "sell_goods#index"
  #root "users#new"
  resources :users, only: [:edit, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :sell_goods do
    resources :orders
  end
end
