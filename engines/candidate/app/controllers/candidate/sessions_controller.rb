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
      if @session.valid?
        session[:candidate_id] = @session.id
      end
    end

    def destroy
      session[:candidate_id] = nil

      redirect_to candidate.root_path
    end

    private

    def set_params
      params.require(:session).permit(:cpf, :password)
    end

    def set_title 
      @header_title    = 'meu_cadastro'
      @header_subtitle = 'realizar_acesso'
      @header_backlink = 'app_home'
    end
  end
end