Rails.application.routes.draw do

  devise_for :users
  resources :todos, only: [:new, :create, :index]

  match 'todos/complete' => 'todos#complete', :via => :post

  get 'about' => 'home#about'
  root to: 'home#index'
  
  end
