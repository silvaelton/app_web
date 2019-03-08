require_dependency 'application_controller'

module Entity
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'

    before_action :authenticate!

    helper_method :authenticate!, :current_entity

    private

    def current_entity
      Entity::Cadastre.find_by(id: session[:entity_id])
    end

    def authenticate!
      if current_entity.nil? && controller_name != "sessions"
        redirect_to entity.new_session_path
      end
    end

  end
end
