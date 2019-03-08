require_dependency 'external/application_controller'

module External
  class CadastresController < ApplicationController

    def index
      redirect_to action: :new
    end

    def new
      @cadastre = External::Cadastre.new
    end
    
    
    def create
      @cadastre = External::Cadastre.new(set_params)
      
      if @cadastre.valid?
        redirect_to external.cadastre_path(@cadastre.id) 
      end
    end

    def show
    end
    
    private

    def set_params
      params.require(:cadastre).permit(:cpf)
    end

    def set_title
      @header_title = "Pesquisa CPF"
      @header_subtitle = "Formulário de pesquisa"
    end

  end
end