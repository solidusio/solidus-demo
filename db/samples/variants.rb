# frozen_string_literal: true

Spree::Sample.load_sample("option_values")
Spree::Sample.load_sample("products")

solidus_monogram_tshirt = Spree::Product.find_by!(name: "Premium Cotton T-Shirt")
solidus_logo_tshirt = Spree::Product.find_by!(name: "Logo T-Shirt")
ruby_tshirt = Spree::Product.find_by!(name: "Developers T-Shirt")

solidus_logo_hoodie = Spree::Product.find_by!(name: "Oversized Logo Hoodie")
solidus_monogram_hoodie = Spree::Product.find_by!(name: "Monogram Hoodie")
ruby_hoodie = Spree::Product.find_by!(name: "Monogram Hoodie - Ruby")

solidus_beanie = Spree::Product.find_by!(name: "Geek Beanie")
ruby_cap = Spree::Product.find_by!(name: "Developers Cap")

solidus_tote = Spree::Product.find_by!(name: "Cotton Tote - Solidus")
ruby_tote = Spree::Product.find_by!(name: "Cotton Tote - Ruby")

solidus_water_bottle = Spree::Product.find_by!(name: "Insulated Water Bottle - Solidus")
ruby_water_bottle = Spree::Product.find_by!(name: "Insulated Water Bottle - Ruby")

small = Spree::OptionValue.find_by!(name: "Small")
medium = Spree::OptionValue.find_by!(name: "Medium")
large = Spree::OptionValue.find_by!(name: "Large")
extra_large = Spree::OptionValue.find_by!(name: "Extra Large")

blue = Spree::OptionValue.find_by!(name: "Blue")
black = Spree::OptionValue.find_by!(name: "Black")
white = Spree::OptionValue.find_by!(name: "White")
red = Spree::OptionValue.find_by!(name: "Red")

variants = [
  {
    product: ruby_tshirt,
    option_values: [small, red],
    sku: "RUB-0000",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [medium, red],
    sku: "RUB-0001",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [extra_large, red],
    sku: "RUB-0002",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [small, white],
    sku: "RUB-0003",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [medium, white],
    sku: "RUB-0004",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [extra_large, white],
    sku: "RUB-0005",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [medium, black],
    sku: "RUB-0006",
    cost_price: 17
  },
  {
    product: ruby_tshirt,
    option_values: [large, black],
    sku: "RUB-0007",
    cost_price: 17
  },
  {
    product: solidus_logo_tshirt,
    option_values: [small, black],
    sku: "SOL-0000",
    cost_price: 17
  },
  {
    product: solidus_logo_tshirt,
    option_values: [large, black],
    sku: "SOL-0001",
    cost_price: 17
  },
  {
    product: solidus_logo_tshirt,
    option_values: [extra_large, black],
    sku: "SOL-0002",
    cost_price: 17
  },
  {
    product: solidus_monogram_tshirt,
    option_values: [small, white],
    sku: "SOL-0011",
    cost_price: 17
  },
  {
    product: solidus_monogram_tshirt,
    option_values: [medium, white],
    sku: "SOL-0012",
    cost_price: 17
  },
  {
    product: solidus_monogram_tshirt,
    option_values: [large, white],
    sku: "SOL-0013",
    cost_price: 17
  },
  {
    product: solidus_monogram_tshirt,
    option_values: [extra_large, white],
    sku: "SOL-0014",
    cost_price: 17
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [small, black],
    sku: "SOL-HD001",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [small, white],
    sku: "SOL-HD002",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [medium, black],
    sku: "SOL-HD003",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [medium, white],
    sku: "SOL-HD004",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [large, black],
    sku: "SOL-HD005",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [extra_large, black],
    sku: "SOL-HD045",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [large, white],
    sku: "SOL-HD006",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [small, blue],
    sku: "SOL-HD007",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [medium, blue],
    sku: "SOL-HD008",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [large, blue],
    sku: "SOL-HD009",
    cost_price: 27
  },
  {
    product: solidus_monogram_hoodie,
    option_values: [extra_large, blue],
    sku: "SOL-HD010",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [small, white],
    sku: "SOL-HD011",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [medium, white],
    sku: "SOL-HD012",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [extra_large, white],
    sku: "SOL-HD013",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [small, black],
    sku: "SOL-HD014",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [medium, black],
    sku: "SOL-HD015",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [large, black],
    sku: "SOL-HD016",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [extra_large, black],
    sku: "SOL-HD017",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [large, blue],
    sku: "SOL-HD018",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [medium, blue],
    sku: "SOL-HD019",
    cost_price: 27
  },
  {
    product: solidus_logo_hoodie,
    option_values: [extra_large, blue],
    sku: "SOL-HD020",
    cost_price: 27
  }
]

masters = {
  ruby_tshirt => {
    sku: "RUB-00001",
    cost_price: 17
  },
  solidus_monogram_tshirt => {
    sku: "SOL-00001",
    cost_price: 17
  },
  solidus_logo_tshirt => {
    sku: "SOL-LG001",
    cost_price: 17
  },
  solidus_logo_hoodie => {
    sku: "SOL-LGH01",
    cost_price: 27
  },
  solidus_monogram_hoodie => {
    sku: "SOL-MNH01",
    cost_price: 27
  },
  ruby_hoodie => {
    sku: "RUB-HDH01",
    cost_price: 27
  },
  solidus_tote => {
    sku: "SOL-TOT01",
    cost_price: 17
  },
  ruby_tote => {
    sku: "RUB-TOT01",
    cost_price: 17
  },
  solidus_beanie => {
    sku: "SOL-SNC01",
    cost_price: 17
  },
  ruby_cap => {
    sku: "RUB-SNC02",
    cost_price: 17
  },
  solidus_water_bottle => {
    sku: "SOL-MG01",
    cost_price: 7
  },
  ruby_water_bottle => {
    sku: "RUB-MG01",
    cost_price: 7
  }
}

Spree::Variant.create!(variants)

masters.each do |product, variant_attrs|
  product.master.update!(variant_attrs)
end
