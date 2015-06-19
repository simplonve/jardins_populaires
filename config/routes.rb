Rails.application.routes.draw do
  resources :annonces 
  resources :users

  root 'annonces#index'
  get '/result', to: 'annonces#result'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
   get '/logout', to: 'sessions#destroy'

end
