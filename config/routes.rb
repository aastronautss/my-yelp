Rails.application.routes.draw do
  root to: 'businesses#index'

  get 'home', to: 'businesses#index'

  get 'register', to: 'users#new'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :users, only: [:show, :create]
  resources :businesses, only: [:show, :new, :create] do
    resources :reviews, only: [:create]
  end
end
