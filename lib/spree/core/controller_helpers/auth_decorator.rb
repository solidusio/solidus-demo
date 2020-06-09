# frozen_string_literal: true

require 'cancan'

module Spree::Core::ControllerHelpers::AuthDecorator
  # Overriding this to always return a user with an admin role
  def try_spree_current_user
    Spree::User.new(
      spree_roles: Spree::Role.where(name:"admin"),
      email: "test@solidus.io"
    )
  end
end

Spree::Core::ControllerHelpers::Auth.prepend Spree::Core::ControllerHelpers::AuthDecorator
