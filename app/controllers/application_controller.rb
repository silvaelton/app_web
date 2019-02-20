class ApplicationController < ActionController::Base
  after_action :allow_cors

  helper_method :header_title

  private

  def allow_cors
    response.headers["X-Frame-Options"] = "ALLOWALL"
  end

  def header_title(title = nil)
    title
  end

end
