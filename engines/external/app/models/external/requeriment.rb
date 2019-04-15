require_dependency 'support/attendance/requeriment'

module External
  class Requeriment < Support::Attendance::Requeriment
    belongs_to :requeriment_category, required: false, foreign_key: :category_id
    has_many :requeriment_attachments

    validates :name, :category_id,:city_id, :address, :content, presence: true
    validates :telephone, numericality: true, presence: true
    validates :celphone, numericality: true, allow_blank: false 
  end
end