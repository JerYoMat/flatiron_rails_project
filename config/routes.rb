Rails.application.routes.draw do
  root   'static_pages#home'
  get    '/about',   to: 'static_pages#about'
  get    '/signup',  to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  get '/auth/facebook/callback' => 'sessions#facebook_create'
  resources :users
  resources :tips, only: [:create, :destroy]
  resources :lessons, only: [:show, :index]
end

