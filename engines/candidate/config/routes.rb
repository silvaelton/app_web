Candidate::Engine.routes.draw do
  root 'home#index'
  
  resources :sessions

  namespace :attendance do 
    get '/', to: 'dashboard#index'
    
    resources :tickets do
      resources :cadastres
      resources :dependents
      resources :incomes
      resources :contacts
      resources :ticket_documents
    end
    
    resources :requeriments
    resources :schedules
    resources :chats
  end
  
  resources :contacts
  resources :notifications
  resources :cadastres

end
