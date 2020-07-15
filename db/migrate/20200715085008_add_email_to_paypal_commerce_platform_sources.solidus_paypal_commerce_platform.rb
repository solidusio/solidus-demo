# This migration comes from solidus_paypal_commerce_platform (originally 20200702122528)
class AddEmailToPaypalCommercePlatformSources < ActiveRecord::Migration[5.2]
  def change
    add_column :paypal_commerce_platform_sources, :paypal_email, :string
  end
end
