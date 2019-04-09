require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class TicketsController < ApplicationController

      def index
      end 

      def new
      end
      
      private

      def set_title
        @header_title = "Atendimento"
        @header_backlink = candidate.root_path
      end

    end
  end
end