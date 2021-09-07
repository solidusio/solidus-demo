# frozen_string_literal: true

module Spree
  module CustomScope
    def self.prepended(base)
      base.scope :featured, -> { where(featured: true) }
    end

    Product.prepend(CustomScope)
  end
end
