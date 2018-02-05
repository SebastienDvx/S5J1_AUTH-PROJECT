Rails.application.routes.draw do

  get '/login', to: 'sessions#new'

  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  root 'users#home'
  get '/reponse', to: 'users#reponse'
  resources :users
end
