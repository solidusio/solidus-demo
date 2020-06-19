module Spree::OrderDecorator

  def billing_name
    "#{billing_firstname} #{billing_lastname}"
  end

end

Spree::Order.prepend Spree::OrderDecorator
