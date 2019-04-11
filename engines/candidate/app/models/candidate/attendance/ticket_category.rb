require_dependency 'support/attendance/ticket_category'

module Candidate
  module Attendance
    class TicketCategory < Support::Attendance::TicketCategory
      has_many :ticket_category_steps
    end
  end
end