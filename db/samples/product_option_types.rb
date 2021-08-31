# frozen_string_literal: true

Spree::Sample.load_sample("products")

size = Spree::OptionType.find_by!(presentation: "Size")
color = Spree::OptionType.find_by!(presentation: "Color")

solidus_monogram_tshirt = Spree::Product.find_by!(name: "Premium Cotton T-Shirt")
solidus_logo_tshirt = Spree::Product.find_by!(name: "Logo T-Shirt")
ruby_tshirt = Spree::Product.find_by!(name: "Developers T-Shirt")
solidus_logo_hoodie = Spree::Product.find_by!(name: "Oversized Logo Hoodie")
solidus_monogram_hoodie = Spree::Product.find_by!(name: "Monogram Hoodie")

solidus_monogram_tshirt.option_types = [size, color]
solidus_logo_tshirt.option_types = [size, color]
ruby_tshirt.option_types = [size, color]
solidus_logo_hoodie.option_types = [size, color]
solidus_monogram_hoodie.option_types = [size, color]
solidus_monogram_tshirt.save!
