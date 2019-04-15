require_dependency 'external/application_controller'

module External
  class SchedulesController < ApplicationController
    
    def index
    end

    def new
      @schedule = External::Schedule.new
      
      @header_title = "Novo agendamento"
      @header_backlink = external.schedules_path
    end
    
    def create
      @schedule = External::Schedule.new(set_params)
      @schedule.save
      
      @header_title = "Novo agendamento"
      @header_backlink = external.schedules_path      
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_params
    end

    def set_title
      @header_title = "Agendamentos"
      @header_backlink = "app_home"
    end

  end
end