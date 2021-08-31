# frozen_string_literal: true

module SolidusDemo
  module Spree
    module Product
      module CustomQuery
        def featured(limit = 3)
          all_products.featured.order('RANDOM()').limit(limit)
        end

        ::Spree::Taxon.prepend self
      end
    end
  end
end
