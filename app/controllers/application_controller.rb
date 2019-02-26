class ApplicationController < ActionController::Base
  after_action :allow_cors
  before_action :set_title
  
  private

  def allow_cors
    response.headers["X-Frame-Options"] = "ALLOWALL"
  end

  def set_title
    @header_title = "title_is_blank"
    @header_subtitle = "subtitle_is_blank"
  end
 
end
