Rails.application.routes.draw do
  root 'tweets#home'
  get '/about', to:'tweets#about'
end
