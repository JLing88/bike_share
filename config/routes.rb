Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'stations#index'
  #root path needs to change
  resources :stations, only: [:index, :show]

  resources :conditions, only: [:index, :show]

  resources :users, only: [:new, :create, :show]

  resources :trips, only: [:index, :show]


  resources :items, only: [:show, :index]
  get '/bike-store', to: 'items#index'

  post '/cart_items', to: 'cart_items#create'
  post 'cart_items/:id/add', to: 'cart_items#add_item'
  post 'cart_items/:id/decrease', to: 'cart_items#decrease_item'
  delete '/cart_items', to: 'cart_items#destroy'
  get '/cart', to: 'cart_items#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"

  get '/dashboard', to: "dashboard#show"

  get '/:id', to: 'stations#show'
end
