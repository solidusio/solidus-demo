# frozen_string_literal: true

module Spree
  module UnlockSampleData
    def with_lock
      return super if sample_indicator_id

      yield
    end
  end

  StockItem.prepend(UnlockSampleData)
end
