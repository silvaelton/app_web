module Candidate
  class Session
    include ActiveModel::Model

    attr_accessor :cpf, :password

    validates :cpf, :password, presence: true
  end
end