Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :followings
      get :followers
      get :refusals
      get :refusers
      get :likes
      get :joy
      get :angry
      get :sad
      get :happy
    end
  end
  
  resources :posts, only: [:create, :destroy, :new, :show] do
    resources :comments, only: [:create, :destroy, :show, :index]
    member do
      get :joy
      get :angry
      get :sad
      get :happy
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  resources :rejects, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
  resources :notifications, only: :index
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
