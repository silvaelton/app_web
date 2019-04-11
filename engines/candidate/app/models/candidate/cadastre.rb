require_dependency 'support/candidate/cadastre'

module Candidate
  class Cadastre < Support::Candidate::Cadastre
    has_many :tickets, class_name: "Candidate::Attendance::Ticket", foreign_key: :cadastre_id

    def policy
      call_policy('Support::Attendance::CadastrePolicy', self)
    end
  end
end