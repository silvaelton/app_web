require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class TicketsController < ApplicationController

      def index
      end 

      def new
        @ticket_service = Support::Attendance::TicketService.new(cadastre_id: current_candidate.id)
        @ticket = current_candidate.tickets.new

        @header_title = "Novo atendimento"
        @header_backlink = candidate.attendance_tickets_path
      end

      def create
        @ticket = current_candidate.tickets.new(set_params)
        @ticket.save
      end
      
      private

      def set_params
        params.require(:attendance_ticket).permit(:category_id)
      end

      def set_title
        @header_title = "Atendimento"
        @header_backlink = candidate.root_path
      end

    end
  end
end