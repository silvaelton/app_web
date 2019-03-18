require_dependency 'support/attendance/requeriment_document'

module External
  class RequerimentDocument < Support::Attendance::RequerimentDocument
    mount_uploader :attachment, External::RequerimentUploader

    validates :attachment, presence: true

    
  end
end