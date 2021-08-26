# frozen_string_literal: true

Spree::Sample.load_sample("products")

size = Spree::OptionType.find_by!(presentation: "Size")
color = Spree::OptionType.find_by!(presentation: "Color")

solidus_tshirt = Spree::Product.find_by!(name: "Solidus T-Shirt")
solidus_long = Spree::Product.find_by!(name: "Solidus Long Sleeve")
solidus_womans = Spree::Product.find_by!(name: "Solidus Womans")
solidus_hoodie = Spree::Product.find_by!(name: "Solidus Hoodie Zip")
solidus_tshirt.option_types = [size, color]
solidus_long.option_types = [size, color]
solidus_womans.option_types = [size, color]
solidus_tshirt.save!
