# frozen_string_literal: true

module Spree
  module ImageSizes
    def self.prepended(base)
      base.attachment_definitions[:attachment][:styles] = {
        mini: '120x180>',
        small: '680x1020>',
        product: '680x1020>',
        large: '680x1020>'
      }
    end

    Spree::Image.prepend(ImageSizes)
  end
end
