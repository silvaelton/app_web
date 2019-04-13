require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class DocumentTypesController < ApplicationController
      before_action :set_ticket
      before_action :set_title
      
      def index
        session[:dependent_mirror_id] = params[:dependent_mirror_id] if params[:dependent_mirror_id].present?
      end

      private
    
      def set_title
        @header_title = "Envio de documentos"
        @header_backlink = candidate.attendance_ticket_steps_path(@ticket)
      end

      def set_ticket
        @ticket        = current_candidate.tickets.find(params[:ticket_id])
        @ticket_step   = @ticket.ticket_steps.find(params[:step_id])   
      end
    end
  end
end