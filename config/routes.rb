Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  resources :users, only: [:index, :show]
  resources :tweets, only: [:create, :destroy]
  get '/about', to:'tweets#about'
end
