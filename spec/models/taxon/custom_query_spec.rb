# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Taxon Featured Query", type: :model do
  let!(:featured_products) { create_list(:product, 5, featured: true) }
  let!(:products) { create_list(:product, 10) }
  let!(:taxon) { create(:taxon, products: products + featured_products) }

  describe 'featured query' do
    it 'returns three featured products that belong to the taxon' do
      featured_product = taxon.featured
      expect(featured_product.count).to eq(3)
      expect(featured_product.first.featured).to be_truthy
      expect(featured_product.second.featured).to be_truthy
      expect(featured_product.third.featured).to be_truthy
    end
  end
end
