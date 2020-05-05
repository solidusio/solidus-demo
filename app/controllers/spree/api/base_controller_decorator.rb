Spree::Api::BaseController.class_eval do
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
