require_dependency 'support/candidate/cadastre'

module Candidate
  module Attendance
    class Contact < Support::Candidate::Cadastre
      validates :telephone, :celphone, numericality: true, presence: true
      validates :telephone_optional, numericality: true, allow_blank: true
      validates :email, email: true, presence: true 
      validates :cep, :address, :city_id, presence: true
    end
  end
end