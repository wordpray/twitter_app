Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  resources :users, only: [:index, :show] do
    member do
      get :following
      get :followers
      get :likes
    end
  end
  resources :tweets, only: [:create, :destroy] do
    resources :likes, only: [:create, :destroy]
    resources :replies, only: [:new, :create]
  end
  resources :relationships, only: [:create, :destroy]
  get '/about', to:'tweets#about'
  get '/tweets/search', to:'tweets#search'
end
