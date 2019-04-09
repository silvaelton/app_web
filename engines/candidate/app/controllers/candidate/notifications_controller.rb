require_dependency 'candidate/application_controller'

module Candidate
  class NotificationsController < ApplicationController
    
    def index
      @header_backlink = candidate.root_path 
    end 


    private 

    def set_title
      @header_title = "notificações"
    end

  end
end