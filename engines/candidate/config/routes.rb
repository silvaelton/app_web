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
      resources :steps do 
        resources :cadastres
        resources :dependents
        resources :incomes
        resources :contacts
        
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
