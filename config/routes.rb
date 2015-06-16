Rails.application.routes.draw do
  resources :annonces 

  root 'annonces#index'
  get '/search', to: 'annonces#search'

end
