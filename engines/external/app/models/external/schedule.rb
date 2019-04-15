require_dependency 'support/attendance/agenda_schedule'

module External
  class Schedule < Support::Attendance::AgendaSchedule 
    attr_accessor :category_id

    validates :name, :born, :city_id, :address, :email, :telephone, presence: true
    validates :cpf, cpf: true, numericality: true
    validates :date, :hour, :agenda_id, :category_id, presence: true
  end
end