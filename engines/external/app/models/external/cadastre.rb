module External
  class Cadastre
    include ActiveModel::Model

    attr_accessor :cpf, :id

    validates :cpf, presence: true
    validate  :cpf_exist?

    private

    def cpf_exist?
      self.id = 1
    end
  end
end