# frozen_string_literal: true

module SolidusDemo
  module Spree
    module Product
      module CustomScope
        def self.prepended(base)
          base.scope :featured, -> { where(featured: true) }
        end

        ::Spree::Product.prepend self
      end
    end
  end
end
