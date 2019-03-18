require_dependency 'support/attendance/requeriment'

module External
  class Requeriment < Support::Attendance::Requeriment
    has_many :requeriment_documents
    
  end
end