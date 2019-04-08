require_dependency 'support/attendance/requeriment'

module External
  class Requeriment < Support::Attendance::Requeriment
    has_many :requeriment_attachments

    validates :name, :category_id, :telephone, :celphone, :city_id, :address, :content, presence: true
    
  end
end