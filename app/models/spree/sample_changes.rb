module Spree
  class SampleChanges < Spree::Base
    belongs_to :changeable, polymorphic: true
  end
end
