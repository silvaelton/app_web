require_dependency 'support/attendance/ticket_category_step'

module Candidate
  module Attendance
    class TicketCategoryStep < Support::Attendance::TicketCategoryStep
      belongs_to :ticket_category
      has_many   :step_documents, foreign_key: :category_step_id
    end
  end
end