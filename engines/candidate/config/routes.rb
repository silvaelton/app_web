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
      get 'close'
      
      resources :ticket_terms
      resources :steps do 
        resources :cadastre_contacts
        resources :cadastres
        
        resources :dependents do 
          get 'close', on: :collection
        end

        resources :incomes do
          get 'close', on: :collection
        end
        
        get 'document_close'
        
        get 'reopen'
        get 'reopen_step'

        resources :document_types do
          resources :documents do
            get 'delete'
          end
        end

      end
    end

    resources :contacts
    resources :schedules
  end
  

end
