require_dependency 'candidate/application_controller'

module Candidate
  class SessionsController < ApplicationController 
    before_action :set_title

    def index 
      redirect_to action: :new
    end

    def new
      @session = Candidate::Session.new
    end

    def create
      @session =  Candidate::Session.new(set_params)
      @session.valid?
    end

    private

    def set_params
      params.require(:session).permit(:cpf, :password)
    end

    def set_title 
      @header_title = 'meu cadastro'
    end
  end
end