Rails.application.routes.draw do
  # resources :recipes
  # resources :users

  post '/signup', to: 'users#create' #create a new user and signup to db
  get '/me', to: 'users#show' #auto login; they stay logged in even after a page reload or nav
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/recipes', to: 'recipes#index'
  post '/recipes', to: 'recipes#create'
end
