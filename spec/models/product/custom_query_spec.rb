# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "Product queries", type: :model do
  let!(:taxon_products) { create_list(:product, 5) }
  let!(:taxon) { create(:taxon)}
  let!(:products) { create_list(:product, 10) }
  before do
    taxon_products.each do |product|
      Spree::Classification.create!(product: product, taxon: taxon)
    end
  end

  describe 'Similar Products Query' do
    let(:visited_product) { taxon.products.first }

    it 'returns similar products' do
      expect(Spree::Product.count).to eq(15)
      expect(visited_product.similar_products(5).count).to eq(4)
      expect(visited_product.similar_products).to_not include(visited_product)
      expect(visited_product.similar_products.count).to eq(3)
    end
  end
end
