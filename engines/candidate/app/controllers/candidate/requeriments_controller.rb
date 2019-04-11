require_dependency 'candidate/application_controller'

module Candidate
  class RequerimentsController < ApplicationController
    
    def index
    end 

    private

    def set_title
      @header_title = "Requerimentos"
      @header_backlink = candidate.root_path
    end

  end
end