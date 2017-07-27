Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  get '/about', to:'tweets#about'
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
    get 'search', on: :collection
  end
  resources :relationships, only: [:create, :destroy]
end
