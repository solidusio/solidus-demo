# frozen_string_literal: true

module Spree
  module CustomQuery
    def featured(limit = 3)
      all_products.featured.order('RANDOM()').limit(limit)
    end

    Taxon.prepend(CustomQuery)
  end
end
