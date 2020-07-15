# frozen_string_literal: true

Deface::Override.new(
  name: "components/products/product_submit/add_paypal_product_button",
  virtual_path: "spree/components/products/_product_submit",
  insert_bottom: "#product-price",
  original: "9897889a0aaff4f4f0c66600d7397f743d2e8bf7",
  source: :partial,
  partial: 'solidus_paypal_commerce_platform/product/product_buttons'
)
