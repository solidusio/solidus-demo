# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Product scopes", type: :model do
  let!(:featured_products) { create_list(:product, 5, featured: true) }
  let!(:products) { create_list(:product, 10) }

  describe 'featured scope' do
    it 'returns featured products' do
      expect(Spree::Product.count).to eq(15)
      expect(Spree::Product.featured.count).to eq(5)
    end
  end
end
