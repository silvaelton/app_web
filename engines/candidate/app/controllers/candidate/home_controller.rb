require_dependency 'candidate/application_controller'

module Candidate
  class HomeController < ApplicationController
    layout 'application-less'
    
    def index
    end
    
    private 

    def set_title
      @header_title = "meu_cadastro"
      @header_subtitle = "área_restrita"
    end
  end
end