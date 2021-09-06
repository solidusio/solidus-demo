# frozen_string_literal: true

module SolidusGraphqlApi
  # Use demo user for the POST /graphql endpoint
  module SolidusDemoUser
    def current_user
      token = bearer_token || order_token
      return unless token

      Current.user = Spree::LegacyUser.solidus_demo_user(token)
    end
  end

  Context.prepend(SolidusDemoUser)
end
