Rails.application.routes.draw do
  mount SolidusPaypalCommercePlatform::Engine, at: '/solidus_paypal_commerce_platform'

  # We ask that you don't use the :as option here, as Solidus relies on it being the default of "spree"
  mount Spree::Core::Engine, at: '/'
end
