# frozen_string_literal: true

require 'cancan'

module Spree
  module Core
    module ControllerHelpers
      module Auth
        # Needs to be overriden so that we use Spree's Ability rather than anyone else's.
        # Creates a user with admin ability to spoof CanCan permissions
        def current_ability
          @current_ability ||= Spree::Ability.new(try_spree_current_user)
        end

        def redirect_back_or_default(default)
          redirect_to(session["spree_user_return_to"] || default)
          session["spree_user_return_to"] = nil
        end

        def set_guest_token
          unless cookies.signed[:guest_token].present?
            cookies.permanent.signed[:guest_token] = {
              value: SecureRandom.urlsafe_base64(nil, false),
              httponly: true
            }
          end
        end

        def store_location
          Spree::UserLastUrlStorer.new(self).store_location
        end

        # proxy method to *possible* spree_current_user method
        # Authentication extensions (such as spree_auth_devise) are meant to provide spree_current_user
        def try_spree_current_user
          # This one will be defined by apps looking to hook into Spree
          # As per authentication_helpers.rb
          Spree::User.new(
            spree_roles: Spree::Role.where(name:"admin"),
            id:1,
            email: "test@solidus.io"
          )
        end
      end
    end
  end
end
