class ApplicationController < ActionController::Base
  after_action :allow_cors

  helper_method :title_bar

  private

  def allow_cors
    response.headers["X-Frame-Options"] = "ALLOWALL"
  end

  def title_bar
    "Requerimentos"
  end
end
