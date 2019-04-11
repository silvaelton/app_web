require_dependency 'support/attendance/step_document'

module Candidate
  module Attendance
    class StepDocument < Support::Attendance::StepDocument
      belongs_to :document_type
    end
  end
end