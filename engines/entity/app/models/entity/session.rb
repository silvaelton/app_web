module Entity
  class Session
    include ActiveModel::Model
    attr_accessor :cnpj, :password, :id

    validates :cnpj, :password, presence: true
    validate  :authenticate

    private

    def authenticate
      entity = Entity::Cadastre.find_by(cnpj: cnpj)
      
      if entity.nil? || (entity.password != self.password)
        errors.add(:base, 'CNPJ ou senha incorreto')
      else
        self.id = entity.id
      end
    end
  end
end