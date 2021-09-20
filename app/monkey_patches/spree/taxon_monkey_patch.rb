# frozen_string_literal: true

module Spree
  module CustomQueries
    def featured(limit = 3)
      all_products.featured.order('RANDOM()').limit(limit)
    end

    def all_products_except(product_ids)
      all_products.where.not(id: product_ids)
    end

    Taxon.prepend(CustomQueries)
  end
end
