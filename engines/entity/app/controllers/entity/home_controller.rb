require_dependency 'entity/application_controller'

module Entity
  class HomeController < ApplicationController
    layout 'application-less'
    
    def index
    end

    private

    def set_title
      @header_title = "minha_entidade"
      @header_subtitle = "área_restrita"
    end
  end
end