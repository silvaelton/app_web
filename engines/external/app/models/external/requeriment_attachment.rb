require_dependency 'support/attendance/requeriment_attachment'

module External
  class RequerimentAttachment < Support::Attendance::RequerimentAttachment
    mount_uploader :attachment, Support::Attendance::RequerimentUploader

    validates :attachment, presence: true

    
  end
end