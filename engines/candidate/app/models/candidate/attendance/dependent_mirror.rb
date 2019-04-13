require_dependency 'support/candidate/cadastre_mirror'

module Candidate
  module Attendance
    class DependentMirror < Support::Candidate::DependentMirror
      belongs_to :cadastre_mirror
      
      validates :name, :born, :gender_id, :kinship_id, presence: true
      validates :cpf, cpf: true, numericality: true, allow_blank: true
      validates :cpf, :rg, :rg_org, :rg_uf_id, presence: true, if: -> { is_major? }
      validates :special_condition_type_id, presence: true, if: -> { self.special_condition }
      validates :civil_state_id, presence: true, if: -> { is_major? }
      validates :nationality, :place_birth, presence: true
      validate  :spouse_present?

      private

      def is_major?
        return false if age.nil? 
        return true  if age >= 14
      end

      def spouse_present?
        if cadastre_mirror.dependent_mirrors.where(kinship_id: 6).present?
          errors.add(:kinship_id, "- já existe um cônjuge cadastrado, remove-o antes.")
        end
      end
    end
  end
end