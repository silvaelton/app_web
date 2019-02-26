require_dependency 'entity/application_controller'

module Entity
  class SessionsController < ApplicationController
    before_action :set_title

    def new
      @session = Entity::Session.new
    end
    
    def create
      @session = Entity::Session.new(set_params)
      @session.valid?
    end

    private

    def set_params
      params.require(:session).permit(:cnpj, :password)
    end
    
    def set_title
      @header_title = "minha entidade"
      @header_subtitle = "acesso restrito"
    end
  end
end