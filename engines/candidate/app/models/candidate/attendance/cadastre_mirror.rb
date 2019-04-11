require_dependency 'support/candidate/cadastre_mirror'

module Candidate
  module Attendance
    class CadastreMirror < Support::Candidate::CadastreMirror
      validates :name, :cpf, :rg, :rg_org, :rg_uf_id, :born, :gender_id, :civil_state_id, :arrival_df, presence: true
      validates :special_condition_type_id, presence: true, if: -> { self.special_condition }
    end
  end
end