require_dependency 'entity/application_controller'

module Entity
  class NotificationsController < ApplicationController
    
    def index
    end 

    private

    def set_title
      @header_title = "minha_entidade"
      @header_subtitle = "minhas_notificações"
    end
  end
end