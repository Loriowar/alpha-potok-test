Rails.application.routes.draw do
  root 'home#index'
  post '/' => 'home#calculate'

  resources :builder, only: [:new, :create]
end
