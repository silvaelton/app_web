require_dependency 'external/application_controller'

module External
  class RequerimentsController < ApplicationController
    
    def index
      redirect_to action: :new
    end

  end
end