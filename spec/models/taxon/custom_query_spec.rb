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

  describe 'all products except' do
    let(:product_ids) { products.map(&:id) }
    let(:excluded_products) { product_ids[0..4] }
    let(:excluded_product) { product_ids[0] }

    it 'returns all products that belong to the taxon except for input ids' do
      expect(taxon.all_products_except(excluded_products).count).to eq(10)
      expect(taxon.all_products_except(excluded_products)).to_not include(excluded_products)
      expect(taxon.all_products_except(excluded_product).count).to eq(14)
      expect(taxon.all_products_except(excluded_product)).to_not include(excluded_product)
    end
  end
end
