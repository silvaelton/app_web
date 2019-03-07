require_dependency 'application_controller'

module Candidate
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'

    before_action :authenticate!

    helper_method :authenticate!, :current_candidate

    private

    def current_candidate
      Candidate::Cadastre.find_by(id: session[:candidate_id])
    end

    def authenticate!
      if current_candidate.nil? && controller_name != "sessions"
        #redirect_to candidate.new_session_path
      end
    end

  end
end
