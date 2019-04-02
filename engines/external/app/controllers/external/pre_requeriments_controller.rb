require_dependency 'external/application_controller'

module External
  class PreRequerimentsController < ApplicationController

    def index
      redirect_to action: :new
    end

    def new
      session[:external_requeriment_cpf] = nil
      @requeriment = External::PreRequeriment.new

    end
    
    def create
      @requeriment = External::PreRequeriment.new(set_params)
      
      if @requeriment.valid?
        session[:external_requeriment_cpf] = @requeriment.cpf
      end
    end

    private

    def set_params
      params.require(:pre_requeriment).permit(:cpf)
    end

    def set_title
      @header_title    = "Requerimentos"
      @header_backlink = 'app_home'
    end

  end
end