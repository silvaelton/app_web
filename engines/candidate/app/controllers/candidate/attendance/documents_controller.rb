require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class DocumentsController < ApplicationController
      before_action :set_ticket
      before_action :set_ticket_step
      before_action :set_ticket_document_type
      before_action :set_title
      before_action :set_dependent_mirror

      def index
        @ticket_document = Candidate::Attendance::TicketDocument.new(ticket_id: @ticket.id, ticket_step_id: @ticket_step.id, 
                                                                     document_type_id: @ticket_document_type.id, 
                                                                     dependent_mirror_id: @dependent_mirror_id)

        @header_backlink = candidate.attendance_ticket_step_document_types_path(@ticket, @ticket_step)
      end 

      def create
        @ticket_document = Candidate::Attendance::TicketDocument.where(ticket_id: @ticket.id, ticket_step_id: @ticket_step.id, 
                                                                       document_type_id: @ticket_document_type.id, 
                                                                       dependent_mirror_id: @dependent_mirror_id).new(set_params)
        @ticket_document.save
      end

      def show
        @document = @ticket_step.ticket_documents.find(params[:id])
      end

      def delete
        @document = @ticket_step.ticket_documents.find(params[:document_id])
      end
      
      def destroy
        @document = @ticket_step.ticket_documents.find(params[:id])
        @document.destroy
      end

      def close 
        @ticket_step.update(document: true, document_at: Time.now)
      end

      private

      def set_params
        params.require(:attendance_ticket_document).permit(:attachment)
      end
    
      def set_ticket
        @ticket = current_candidate.tickets.find(params[:ticket_id])
        @dependent_mirror_id = session[:dependent_mirror_id]
        
      end
      
      def set_ticket_step
        @ticket_step = @ticket.ticket_steps.find(params[:step_id])
      end

      def set_ticket_document_type
        @ticket_document_type = Candidate::Attendance::DocumentType.find(params[:document_type_id])
      end

      def set_title
        @header_title = "Envio de documentos"
        @header_backlink = candidate.attendance_ticket_step_document_types_path(@ticket, @ticket_step)
      end

      def set_dependent_mirror 
        @dependent_mirror_id = session[:dependent_mirror_id]
      end
    end
  end
end