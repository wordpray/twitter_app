Rails.application.routes.draw do
  devise_for :users
  root 'tweets#home'
  get '/about', to:'tweets#about'
end
