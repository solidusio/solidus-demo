# frozen_string_literal: true

module SolidusDemo
  module Spree
    module StockItem
      module UnlockSampleData
        def with_lock
          return super if sample_indicator_id

          yield
        end
      end
    end
  end
end
