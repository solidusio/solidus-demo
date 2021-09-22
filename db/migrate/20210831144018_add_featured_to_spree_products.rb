class AddFeaturedToSpreeProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :spree_products, :featured, :boolean, default: false
  end
end
