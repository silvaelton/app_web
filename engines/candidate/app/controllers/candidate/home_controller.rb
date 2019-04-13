require_dependency 'candidate/application_controller'

module Candidate
  class HomeController < ApplicationController

    def index
      @cadastre = current_candidate.presenter
      @header_backlink = 'app_home'
    end
    
    private 

    def set_title
      @header_title = "meu_cadastro"
      @header_subtitle = "área_restrita"
    end
  end
end