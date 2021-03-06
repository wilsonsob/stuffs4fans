Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :products do
    resources :orders, only: [:new, :create]

  end
  resources :orders, only: [:index, :show]

  get '/my_orders', to: 'pages#my_orders'
  get '/my_offers', to: 'pages#my_offers'
  get '/artists', to: 'pages#artists'
  get '/artists/:id', to: 'pages#artist', as: 'artist'
end
