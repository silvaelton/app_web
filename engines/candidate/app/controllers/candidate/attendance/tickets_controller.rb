require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class TicketsController < ApplicationController

      def index
      end 

      def new
        @ticket_service = Support::Attendance::TicketService.new(cadastre_id: current_candidate.id)
        @ticket_service.create_ticket

        redirect_to action: :index
      end
      
      private

      def set_title
        @header_title = "Atendimento"
        @header_backlink = candidate.root_path
      end

    end
  end
end