Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  resources :users, only: [:index, :show]
  get '/about', to:'tweets#about'
end
