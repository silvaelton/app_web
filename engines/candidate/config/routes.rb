Candidate::Engine.routes.draw do
  root 'cadastres#index'
  
  resources :sessions

  namespace :attendance do 
    
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
