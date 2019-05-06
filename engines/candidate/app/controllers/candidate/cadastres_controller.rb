require_dependency 'candidate/application_controller'

module Candidate
  class CadastresController < ApplicationController
    
    def index
    end
    
    def show
      @cadastre = Candidate::Cadastre.find(params[:id])
      @header_backlink = candidate.root_path
    end

    private 

    def set_title
      @header_title = "meu_cadastro"
      @header_subtitle = "área_restrita"
    end
  end
end