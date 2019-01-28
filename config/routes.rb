Rails.application.routes.draw do
  root 'home#index'

  mount External::Engine => '/external', as: :external
end
