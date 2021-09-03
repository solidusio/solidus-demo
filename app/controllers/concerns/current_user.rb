# frozen_string_literal: true

module CurrentUser
  extend ActiveSupport::Concern

  included do
    before_action :spree_current_user
    helper_method :spree_current_user
  end

  private

  def spree_current_user
    token = cookies.signed[:guest_token]
    return Current.user if Current.token == token

    Current.user = Spree::LegacyUser.solidus_demo_user(token)
  end
end
