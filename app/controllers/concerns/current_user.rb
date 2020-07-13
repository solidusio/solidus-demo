# frozen_string_literal: true

module CurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :spree_current_user
    helper_method :spree_current_user
  end

  private

  def spree_current_user
    token = request.cookies["guest_token"]
    return Current.user if Current.token == token

    Current.user = Spree::LegacyUser.new(
      id: 0,
      spree_roles: Spree::Role.where(name: "admin"),
      email: "test@solidus.io",
      spree_api_key: token[0...48],
    )
  end
end
