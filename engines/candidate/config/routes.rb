Candidate::Engine.routes.draw do
  root 'home#index'
  
  resources :sessions
  resources :cadastres

  namespace :attendance do 
    get '/', to: 'tickets#index'
    
    resources :tickets do
      resources :ticket_steps do 
        resources :ticket_step_cadastres
        resources :ticket_step_dependents
        resources :ticket_step_incomes
        resources :ticket_step_contacts
        resources :ticket_step_documents
      end
    end

    resources :contacts
    resources :schedules
  end
  
  resources :notifications
  
end
