# frozen_string_literal: true

module SolidusDemo
  module Spree
    module HomeController
      module AddFeaturedToSpreeProducts
        def index
          @searcher = build_searcher(params.merge(include_images: true))
          @products = @searcher.retrieve_products
          @featured_clothing = ::Spree::Taxon.find_by(name: 'Clothing').featured
          @featured_accessories = ::Spree::Taxon.find_by(name: 'Accessories').featured(2)
        end

        ::Spree::HomeController.prepend self
      end
    end
  end
end
