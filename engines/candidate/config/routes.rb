Candidate::Engine.routes.draw do
  root 'home#index'
  
  resources :sessions
  
  resources :cadastres
  resources :notifications
  resources :requeriments
  resources :indications
  resources :questions
  

  namespace :attendance do 
    get '/', to: 'tickets#index'
    
    resources :tickets do
      resources :ticket_steps do 
        resources :ticket_step_cadastres
        resources :ticket_step_dependents
        resources :ticket_step_contacts
        
        resources :ticket_step_document_types do
          resources :ticket_step_documents
        end

      end
    end

    resources :contacts
    resources :schedules
  end
  

end
