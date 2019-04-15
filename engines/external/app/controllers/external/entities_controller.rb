require_dependency 'external/application_controller'

module External
  class EntitiesController < ApplicationController
    
    def index
      @header_title = "Entidades"
      @header_backlink = 'app_home'
    end
    
    def new 
      @header_title = "Pesquisa CNPJ"
      @header_backlink = external.entities_path
    end
  end
end