# frozen_string_literal: true

FactoryBot.define do
  factory :product_multiple_variants, parent: :product do
    after :create do |product|
      option_type_size = create(:option_type, name: 'size')
      option_type_color = create(:option_type, name: 'color', presentation: 'Color')
      small = create(:option_value, option_type: option_type_size)
      medium = create(:option_value, option_type: option_type_size, presentation: 'M')
      large = create(:option_value, option_type: option_type_size, presentation: 'L')
      xlarge = create(:option_value, option_type: option_type_size, presentation: 'XL')
      blue = create(:option_value, option_type: option_type_color, presentation: 'Blue')
      black = create(:option_value, option_type: option_type_color, presentation: 'Black')
      white = create(:option_value, option_type: option_type_color, presentation: 'White')

      combinations = [[small, blue], [small, black], [small, white], [medium, blue],
                      [large, black], [large, white], [xlarge, blue]]

      create(:product_option_type, option_type: option_type_size, product: product)
      create(:product_option_type, option_type: option_type_color, product: product)

      combinations.each do |combination|
        create(:variant, product: product, option_values: combination)
      end

      create(:price, variant: product.variants.last, amount: 10, currency: 'USD')
    end
  end
end
