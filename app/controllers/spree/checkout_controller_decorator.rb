module Spree::CheckoutControllerDecorator
  private

  def assign_temp_address
    @order.temporary_address = true
  end
end

Spree::CheckoutController.prepend Spree::CheckoutControllerDecorator
