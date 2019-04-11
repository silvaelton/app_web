require_dependency 'candidate/application_controller'

module Candidate
  class QuestionsController < ApplicationController
    
    def index
    end 

    private

    def set_title
      @header_title = "Dúvidas"
      @header_backlink = candidate.root_path
    end

  end
end