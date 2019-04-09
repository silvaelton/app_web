module Candidate
  class Session
    include ActiveModel::Model

    attr_accessor :cpf, :password, :id

    validates :cpf, :password, presence: true
    validate  :authenticate

    private 

    def authenticate
      cadastre = ::Support::Candidate::Cadastre.find_by(cpf: self.cpf)
      
      if cadastre.nil? || (BCrypt::Password.new(cadastre.password) != self.password)
        errors.add(:cpf, "ou senha incorretos")
      else
        self.id = cadastre.id
      end
    end
  end
end