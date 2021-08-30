# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'product swatches', :js, type: :feature do
  let(:product) { create(:product_multiple_variants) }
  before do
    create(:store)
    visit spree.product_path(product)
  end

  it 'shows the product options in the show page' do
    expect(page).to have_css('.optionTypeSize')
    within('.optionTypeSize') do
      selectors = find_all('.selection-size', visible: true).count
      expect(selectors).to eq(4)
    end

    expect(page).to have_css('.optionTypeColor')
    within('.optionTypeColor') do
      selectors = find_all('.selection-color', visible: true).count
      expect(selectors).to eq(3)
    end
  end

  describe 'when selecting another option' do
    it 'updates the selection option type text' do
      selectors_sizes = all('.selection-size')
      selectors_colors = all('.selection-color')
      expect(find('#selected-size').text).to eq('S')
      expect(find('#selected-color').text).to eq('Blue')

      selectors_sizes[1].click
      expect(find('#selected-size').text).to eq('M')

      selectors_sizes[2].click
      selectors_colors[2].click
      expect(find('#selected-size').text).to eq('L')
      expect(find('#selected-color').text).to eq('White')
    end

    it 'hides option types that do not have a match' do
      within('.optionTypeSize') do
        @option_type_size = find_all('.selection-size', visible: true)
      end

      within('.optionTypeColor') do
        @option_type_size[1].click
        color_selectors = find_all('.selection-color', visible: true).count
        expect(color_selectors).to eq(1)

        @option_type_size[2].click
        color_selectors = find_all('.selection-color', visible: true).count
        expect(color_selectors).to eq(2)

        @option_type_size[3].click
        color_selectors = find_all('.selection-color', visible: true).count
        expect(color_selectors).to eq(1)

        @option_type_size[0].click
        color_selectors = find_all('.selection-color', visible: true).count
        expect(color_selectors).to eq(3)
      end
    end

    it 'updates the price if variant price is different than original' do
      expect(find('#product-price').text).to eq('$19.99')

      all('.selection-size')[3].click
      expect(find('#product-price').text).to eq('$10.00')
    end
  end

  describe 'when an Item is added to the cart' do
    it 'adds the correct swatch selection variant to my cart' do
      all('.selection-size')[2].click
      all('.selection-color')[1].click
      find('#add-to-cart-button').click
      expect(find('.item-info__options').text).to have_content('Size: L, Color: White')
    end
  end
end
