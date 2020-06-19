module Spree::Api::BaseControllerDecorator
  def load_user
    @current_api_user ||= Spree::User.new(
        spree_roles: Spree::Role.where(name:"admin"),
        email: "test@solidus.io"
      )
  end

  def authenticate_user
    # Yep, everything is fine here!
    true
  end
end

Spree::Api::BaseController.prepend Spree::Api::BaseControllerDecorator
