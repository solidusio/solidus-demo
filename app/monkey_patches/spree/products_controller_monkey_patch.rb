# frozen_string_literal: true

module Spree
  module AddSimilarProducts
    def show
      @variants = @product.
        variants_including_master.
        display_includes.
        with_prices(current_pricing_options).
        includes([:option_values, :images])

      @product_properties = @product.product_properties.includes(:property)
      @taxon = Spree::Taxon.find(params[:taxon_id]) if params[:taxon_id]
      @similar_products = @product.similar_products
    end

    ProductsController.prepend(AddSimilarProducts)
  end
end
