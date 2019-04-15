require_dependency 'support/attendance/ticket'

module Candidate
  module Attendance
    class Ticket < Support::Attendance::Ticket
      belongs_to :cadastre, class_name: "Candidate::Cadastre"
      belongs_to :ticket_category, foreign_key: :category_id
      belongs_to :situation_type, required: false, class_name: "Support::Attendance::TicketSituationType"

      has_many :ticket_steps
      
      belongs_to :cadastre_mirror, required: false, class_name: "Candidate::Attendance::CadastreMirror"
      
      validates :category_id, presence: true
      validate  :category_is_allowed

      after_create :set_data_ticket

      def policy
        call_policy('Support::Attendance::TicketPolicy', self)
      end

      private

      def category_is_allowed
        if !cadastre.policy.category_allowed?(self.category_id)
          errors.add(:category_id, "não permitida para o cadastro informado")
        end
      end

      def set_data_ticket
        service = Support::Attendance::TicketService.new(ticket_id: self.id, cadastre_id: self.cadastre_id)
        service.create_ticket
      end

    end
  end
end