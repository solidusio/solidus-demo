class ApplicationController < ActionController::Base
  before_action :set_request

  def set_request
    $admin = request.path.include? "/admin"
    $api = request.path.include? "/api"
  end

end
