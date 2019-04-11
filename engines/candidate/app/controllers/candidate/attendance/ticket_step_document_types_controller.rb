require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class TicketStepDocumentTypesController < ApplicationController
      before_action :set_ticket
      before_action :set_title
      
      def index
      end

      private
    
      def set_title
        @header_title = "Dados básicos"
        @header_backlink = candidate.attendance_ticket_ticket_steps_path(@ticket)
      end

      def set_ticket
        @ticket = current_candidate.tickets.find(params[:ticket_id])
        @ticket_step = @ticket.ticket_steps.find(params[:ticket_step_id])   
      end
    end
  end
end