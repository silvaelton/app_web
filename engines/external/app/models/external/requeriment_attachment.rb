require_dependency 'support/attendance/requeriment_attachment'

module External
  class RequerimentAttachment < Support::Attendance::RequerimentAttachment
    mount_uploader :attachment, Suppoert::Attendance::RequerimentUploader

    validates :attachment, presence: true

    
  end
end