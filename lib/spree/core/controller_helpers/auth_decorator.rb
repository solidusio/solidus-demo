# frozen_string_literal: true

require 'cancan'

Spree::Core::ControllerHelpers::Auth.class_eval do
  # Overriding this to always return a user with an admin role
  def try_spree_current_user
    Spree::User.new(
      spree_roles: Spree::Role.where(name:"admin"),
      id:1,
      email: "test@solidus.io"
    )
  end
end
