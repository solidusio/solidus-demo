# frozen_string_literal: true

Deface::Override.new(
  name: "components/cart/cart_items/insert_cart_buttons",
  virtual_path: "spree/components/cart/_cart_items",
  original: "c15d7457875dbbce987638e26fe548e5b9415160",
  insert_after: ".cart-items",
  partial: 'solidus_paypal_commerce_platform/cart/cart_buttons'
)
