Rails.application.routes.draw do

  root 'pages#home'
  get 'about', to: 'pages#about'
  resources :articles
  get 'signup', to: 'users#new'
  resources :users, except: [:new] do
    member do
      get 'demote_mod'
      get 'promote_mod'
      get 'promote_admin'
      get 'demote_admin'
    end
    patch :promote_mod
    patch :demote_mod
    patch :promote_admin
    patch :demote_admin
  end
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  resources :categories
end
