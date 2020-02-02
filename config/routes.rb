Rails.application.routes.draw do

  
 
  get 'follow/index'
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :users
  resources :communities
  resources :posts
  resources :rooms, :only => [:show, :create]
  resources :join_communities, :only => [:show, :create, :destroy]
  
  
  get 'community/search'
  
  post '/follow_users', to: 'follow_users#create'
  delete '/follow_users', to: 'follow_users#destroy'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
