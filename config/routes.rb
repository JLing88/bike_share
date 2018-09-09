Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stations#index'

  resources :stations, only: [:index, :show]

  resources :conditions, only: [:index, :show]

  resources :users, only: [:new, :create, :show]

  resources :trips, only: [:index]

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  # get '/logout', to: "sessions#destroy"
  delete '/logout', to: "sessions#destroy"
end
