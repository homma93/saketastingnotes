Rails.application.routes.draw do
  root to: 'sessions#new'
  
  #accountのroutes
  get 'signup', to: 'accounts#new'
  resources :accounts, only: [:new, :create, :edit, :update, :destroy]
  
  #tastingnote関連のroutes
  resources :tastingnotes
  
  #sessionのroutes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
