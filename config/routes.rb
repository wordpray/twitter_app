Rails.application.routes.draw do
  root 'tweets#home'
  get 'tweets/about'
end
