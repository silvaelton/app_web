require_dependency 'external/application_controller'

module External
  class SearchSchedulesController < ApplicationController
    
    def new
      @header_title = "Pesquisa agendamento"
      @header_backlink = external.schedules_path
    end

    def create
    end

    private


    def set_title
      @header_title = "Agendamentos"
      @header_backlink = "app_home"
    end

  end
end