require_dependency 'entity/application_controller'

module Entity
  class RemembersController < ApplicationController
    
    def new
    end

    def create
    end

    private

    def set_title
      @header_title = "minha entidade"
      @header_subtitle = "recuperação de senha"
    end
 
  end
end