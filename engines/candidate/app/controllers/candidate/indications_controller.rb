require_dependency 'candidate/application_controller'

module Candidate
  class IndicationsController < ApplicationController
    
    def index
    end 

    private

    def set_title
      @header_title = "Indicações"
      @header_backlink = candidate.root_path
    end

  end
end