Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'

  resources :stations, only: [:index, :show]

  resources :conditions, only: [:index, :show]

  resources :users, only: [:new, :create]

  resources :trips, only: [:index, :show]

  namespace :admin do
    resources :stations, only: [:new, :create, :edit, :update, :destroy]
    resources :conditions, only: [:new, :create, :edit, :update, :destroy]
    resources :trips, only: [:new, :create, :edit, :update, :destroy]
    resources :items, only: [:edit, :update]
  end

  resources :items, only: [:show]
  get '/bike-store', to: 'items#index'

  post '/cart_items', to: 'cart_items#create'
  post 'cart_items/:id/add', to: 'cart_items#add_item'
  post 'cart_items/:id/decrease', to: 'cart_items#decrease_item'
  delete '/cart_items', to: 'cart_items#destroy'
  get '/cart', to: 'cart_items#index'

  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get '/logout', to: "sessions#destroy"

  get '/dashboard', to: "dashboard#show"
  get '/stations-dashboard', to: "stations_dashboard#show"
  get '/trips-dashboard', to: "trips_dashboard#show"

  get '/:id', to: 'stations#show'

end
