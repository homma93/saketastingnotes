Rails.application.routes.draw do
  root to: 'sessions#new'
  
  #accountのroutes
  get 'signup', to: 'accounts#new'
  resources :accounts, only: [:new, :create, :edit, :update, :destroy]
  
  #tastingnote関連のroutes
  resources :tastingnotes
  
  #酒造組合サイト
  get 'syuzo_kumiai', to: 'todofukens#index'
  resources :todofukens, only: [:index]
  
  #sessionのroutes
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
end
