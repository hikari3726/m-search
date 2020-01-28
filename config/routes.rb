Rails.application.routes.draw do

  
  get 'sessions/new'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'pages#index'
  resources :users
  resources :communities
  resources :posts
  
  post '/join_communities', to: 'join_communities#create'
  delete '/join_community', to: 'join_communities#destroy'
  get 'community/search'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
end
