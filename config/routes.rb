Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
  #get '/users/new', to: 'users#new'
  resources :rides
  resources :attractions
  resources :users, only: [:new, :create, :show]
  get '/signin', to: 'session#new'
  post '/signin', to: 'session#create'
  delete '/signout', to: 'session#destroy'
  post '/rides', to: 'rides#create'
end
