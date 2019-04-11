require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class TicketStepsController < ApplicationController
      before_action :set_ticket

      def index
      end
      
      def show
        @ticket_category_step = Candidate::Attendance::TicketCategoryStep.find_by(id: params[:id])

        @ticket_service = Support::Attendance::TicketService.new(ticket_id: @ticket.id)
        @ticket_service.create_or_find_step(params[:id])

        @step_id = @ticket_service.ticket_step.id

        case @ticket_category_step.view_form
        when 'cadastre'
          redirect_to candidate.edit_attendance_ticket_ticket_step_ticket_step_cadastre_path(@ticket, @step_id, @ticket.cadastre_mirror_id)
        when 'dependent'
          redirect_to candidate.attendance_ticket_ticket_step_ticket_step_dependents_path(@ticket, @step_id)
        when 'contact'
          redirect_to candidate.edit_attendance_ticket_ticket_step_ticket_step_contact_path(@ticket, @step_id, @ticket.cadastre_mirror_id)
        when 'document'
          redirect_to candidate.attendance_ticket_ticket_step_ticket_step_documents_path(@ticket, @step_id)
        end
      end

      private

      def set_ticket
        @ticket = current_candidate.tickets.find(params[:ticket_id])
      end

      def set_title
        @header_title = "Etapas"
        @header_backlink = candidate.attendance_tickets_path
      end
    
    end
  end
end