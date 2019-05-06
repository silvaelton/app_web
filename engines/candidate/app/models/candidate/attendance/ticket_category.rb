require_dependency 'support/attendance/ticket_category'

module Candidate
  module Attendance
    class TicketCategory < Support::Attendance::TicketCategory
      has_many :ticket_category_steps
      has_many :ticket_category_terms, class_name: 'Support::Attendance::TicketCategoryTerm'
    end
  end
end