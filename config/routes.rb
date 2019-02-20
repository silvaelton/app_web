Rails.application.routes.draw do
  root 'home#index'

  mount External::Engine  => '/external',  as: :external
  mount Entity::Engine    => '/entity',    as: :entity
  mount Candidate::Engine => '/candidate', as: :candidate
  
end
