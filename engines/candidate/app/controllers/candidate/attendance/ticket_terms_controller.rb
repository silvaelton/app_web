module Candidate
  module Attendance
    class TicketTermsController < ApplicationController
      before_action :set_ticket

      def edit
        @ticket.ticket_terms.new(term_id: params[:id])
        @ticket.save

        redirect_to attendance_ticket_steps_path(@ticket)
      end

      private

      def set_ticket
        @ticket = Candidate::Attendance::Ticket.find(params[:ticket_id])
      end

    end
  end
end