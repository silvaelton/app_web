Entity::Engine.routes.draw do
  root 'home#index'

  resources :sessions, only: [:new, :create, :destroy]
  resources :remembers, only: [:new, :create]
  resources :notifications
end
