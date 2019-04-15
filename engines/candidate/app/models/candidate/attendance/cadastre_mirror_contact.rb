require_dependency 'support/candidate/cadastre_mirror'

module Candidate
  module Attendance
    class CadastreMirrorContact < Support::Candidate::CadastreMirror
      validates :telephone, :celphone, numericality: true, presence: true
      validates :telephone_optional, numericality: true, allow_blank: true
      validates :email, email: true, presence: true 
      validates :cep, :address, :city_id, presence: true
    end
  end
end