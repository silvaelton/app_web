class ApplicationController < ActionController::Base
  
  helper_method :title_bar

  private

  def title_bar
    "Requerimentos"
  end
end
