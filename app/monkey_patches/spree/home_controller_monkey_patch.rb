# frozen_string_literal: true

module Spree
  module AddFeaturedToSpreeProduct
    def index
      @searcher = build_searcher(params.merge(include_images: true))
      @products = @searcher.retrieve_products
      @featured_clothing = ::Spree::Taxon.find_by(name: 'Clothing')&.featured
      @featured_accessories = ::Spree::Taxon.find_by(name: 'Accessories')&.featured(2)
    end

    HomeController.prepend(AddFeaturedToSpreeProduct)
  end
end
