# frozen_string_literal: true

# frozen_string_literal: true

module Spree
  module FeaturedSimilarProducts
    def self.prepended(base)
      base.scope :featured, -> { where(featured: true) }
    end

    def similar_products(limit = 3)
      taxons.map do |taxon|
        taxon.all_products_except(self.id).order('RANDOM()')
      end.flatten.uniq.first(limit)
    end

    Product.prepend(FeaturedSimilarProducts)
  end
end
