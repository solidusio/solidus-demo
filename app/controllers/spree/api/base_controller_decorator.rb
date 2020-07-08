module Spree::Api::BaseControllerDecorator
  def self.prepended(base)
    base.include CurrentUser
  end

  private

  def load_user
    @current_api_user = spree_current_user
  end

  def current_api_user
    @current_api_user ||= spree_current_user
  end

  Spree::Api::BaseController.prepend self
end

