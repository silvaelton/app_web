External::Engine.routes.draw do

  # => Requerimentos
  resources :requeriments

  # => Pesquisa CPF
  resources :cadastres

  # => Agendamentos
  resources :schudules
end
