require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class DependentsController < ApplicationController
      before_action :set_ticket
      before_action :set_title

      def index
        session[:dependent_mirror_id] = nil
        
        @dependents = @ticket.cadastre_mirror.dependent_mirrors
      end 

      def new
        
        @dependent = @ticket.cadastre_mirror.dependent_mirrors.new(created: true)

        @header_title = "Novo dependente"
        @header_backlink = candidate.attendance_ticket_step_dependents_path(@ticket, @ticket_step)
      end
      
      def create
        @dependent = @ticket.cadastre_mirror.dependent_mirrors.new(set_params)
        @dependent.created = true
        @dependent.save
      end

      def edit
        @dependent = @ticket.cadastre_mirror.dependent_mirrors.find(params[:id])
      end
      
      def update
        @dependent = @ticket.cadastre_mirror.dependent_mirrors.find(params[:id])
        @dependent.update(set_params)
      end

      def destroy 
      end

      def close 
        @ticket_step.update(data_updated: true, date_updated_at: Time.now, document: true, document_at: Time.now)

        redirect_to attendance_ticket_steps_path(@ticket)
      end

      private
      
      def set_params
        params.require(:attendance_dependent_mirror)
            .permit(:name, :kinship_id, :cpf, :rg, :rg_org, :rg_uf_id, :born, 
                    :gender_id, :place_birth, :civil_state_id, :special_condition,
                    :special_condition_type_id, :cid, :nis, :employment, :nationality, :admission_date)
      end

      def set_title
        @header_title = "Dependentes"
        @header_backlink = candidate.attendance_ticket_steps_path(@ticket)
      end

      def set_ticket
        @ticket = current_candidate.tickets.find(params[:ticket_id])
        @ticket_step = @ticket.ticket_steps.find(params[:step_id])   
      end

    end
  end
end