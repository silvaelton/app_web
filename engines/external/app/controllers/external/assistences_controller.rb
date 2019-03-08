require_dependency 'entity/application_controller'

module External
  class AssistencesController < ApplicationController
    
    def index
    end 

    private

    def set_title
      @header_title = "Assistência Técnica"
      @header_subtitle = "Informações"
    end
  end
end