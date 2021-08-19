module SolidusDemo
  module Spree
    module Image
      module CustomizeSizes
        def self.prepended(klass)
          klass.attachment_definitions[:attachment][:styles] = {
            mini: '120x180>',
            small: '340x510>',
            product: '680x1020>',
            large: '680x1020>'
          }
        end

        ::Spree::Image.prepend self
      end
    end
  end
end
