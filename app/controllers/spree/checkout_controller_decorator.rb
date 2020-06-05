Spree::CheckoutController.class_eval do
  private

  def assign_temp_address
    @order.temporary_address = true
  end
  
end
