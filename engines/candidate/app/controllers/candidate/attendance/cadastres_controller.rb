require_dependency 'candidate/application_controller'

module Candidate
  module Attendance
    class CadastresController < ApplicationController
      before_action :set_ticket
      before_action :set_title

      def edit
        @cadastre_mirror = @ticket.cadastre_mirror
      end 
      
      def update
        @cadastre_mirror = @ticket.cadastre_mirror
        @cadastre_mirror.update(set_params)
        @ticket_step.update(data_updated: true, date_updated_at: Time.now)
      end
      
      private 
      
      def set_params
        params.require(:attendance_cadastre_mirror)
              .permit(:rg, :rg_org, :rg_uf_id, :born, :gender_id, :civil_state_id, :arrival_df, 
                      :special_condition, :special_condition_type_id, :adapted_property, :personal_income)
      end

      def set_title
        @header_title = "Dados básicos"
        @header_backlink = candidate.attendance_ticket_steps_path(@ticket)
      end

      def set_ticket
        @ticket = current_candidate.tickets.find(params[:ticket_id])
        @ticket_step = @ticket.ticket_steps.find(params[:step_id])   
      end
    end
  end
end