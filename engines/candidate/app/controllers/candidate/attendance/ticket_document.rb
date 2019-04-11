module Candidate
  module Attendance
    class TicketDocument < Support::Attendance::TicketDocument
      mount_uploader :attachment, Support::Attendance::TicketUploader
    end
  end
end