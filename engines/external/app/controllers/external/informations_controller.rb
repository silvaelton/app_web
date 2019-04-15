require_dependency 'entity/application_controller'

module External
  class InformationsController < ApplicationController
    
    def index
    end 

    private

    def set_title
      @header_title = "Informações gerais"
      @header_backlink = "app_home"
    end
  end
end