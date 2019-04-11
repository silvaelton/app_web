module Candidate
  module Attendance
    class TicketDocument < Support::Attendance::TicketDocument
      belongs_to :document_type 
      
      mount_uploader :attachment, Support::Attendance::TicketUploader
    end
  end
end