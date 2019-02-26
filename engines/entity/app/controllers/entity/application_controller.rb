require_dependency 'application_controller'

module Entity
  class ApplicationController < ApplicationController
    protect_from_forgery with: :exception

    layout 'application'
  end
end
