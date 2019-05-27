Rails.application.routes.draw do
  root to: 'sessions#new'
  
  get 'signup', to: 'accounts#new'
  resources :accounts, only: [:new, :create, :edit, :update, :destroy]
  
  resources :tastingnotes
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
