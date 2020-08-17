Rails.application.routes.draw do
  resources :users, only: [:index, :create]
  # get '/users', to: 'users#index'

  post '/login', to: 'authentication#login'
end
