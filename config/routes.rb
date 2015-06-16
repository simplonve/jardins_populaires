Rails.application.routes.draw do
  resources :annonces 

  root 'annonces#index'

end
