module Candidate
  module Attendance
    class CadastreContactsController < ApplicationController
      before_action :set_ticket

      def edit
        @contact = Candidate::Attendance::CadastreMirrorContact.find(@ticket.cadastre_mirror_id)
      end
      
      def update
        @contact = Candidate::Attendance::CadastreMirrorContact.find(@ticket.cadastre_mirror_id)
        if @contact.update(set_params)
          @ticket_step.update(data_updated: true, date_updated_at: Time.now)

          redirect_to attendance_ticket_steps_path(@ticket)
        else
          render action: :edit
        end
      end

      private

      def set_params
        params.require(:attendance_cadastre_mirror_contact)
          .permit(:telephone, :telephone_optional, :celphone, :email, :address, :cep, :city_id)
      end

      def set_title 
        @header_title = "Dados de contato"
        @header_backlink = candidate.root_path
      end

      def set_ticket
        @ticket = current_candidate.tickets.find(params[:ticket_id])
        @ticket_step = @ticket.ticket_steps.find(params[:step_id])   
      end

    end
  end
end