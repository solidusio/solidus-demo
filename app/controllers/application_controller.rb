class ApplicationController < ActionController::Base
  before_action :set_request

  def set_request
    $token = request.cookies["guest_token"]
  end

end
