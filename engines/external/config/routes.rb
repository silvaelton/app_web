External::Engine.routes.draw do

  resources :entities
  resources :pre_requeriments
  resources :requeriments do
    get 'done'
    
    resources :requeriment_documents do 
      get 'delete'
    end
  end
  
  resources :cadastres
  resources :schedules
  resources :assistences
  resources :informations
end
