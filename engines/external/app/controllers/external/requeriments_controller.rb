require_dependency 'external/application_controller'

module External
  class RequerimentsController < ApplicationController
    
    def index
    end

    def new
    end

    def create
    end

    def edit
    end

    def update
    end

    def destroy
    end

    private

    def set_requeriment
    end

    def set_title
      @header_title = "Requerimentos"
      @header_subtitle = "Listagem de requerimentos"
    end

  end
end