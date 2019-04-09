module Candidate
  module Attendance
    class ContactsController < ApplicationController
      
      def edit
        @contact = Candidate::Attendance::Contact.find(current_candidate.id)
      end
      
      def update
        @contact = Candidate::Attendance::Contact.find(current_candidate.id)
        @contact.update(set_params)
      end

      private

      def set_params
        params.require(:attendance_contact)
          .permit(:telephone, :telephone_optional, :celphone, :email, :address, :cep, :city_id)
      end

      def set_title 
        @header_title = "Dados de contato"
        @header_backlink = candidate.root_path
      end

    end
  end
end