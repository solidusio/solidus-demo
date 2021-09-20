# frozen_string_literal: true

Spree::Sample.load_sample("taxonomies")
Spree::Sample.load_sample("products")

categories = Spree::Taxonomy.find_by!(name: "Categories")
brands = Spree::Taxonomy.find_by!(name: "Brand")

products = {
  solidus_monogram_tshirt: "Premium Cotton T-Shirt",
  solidus_logo_tshirt: "Logo T-Shirt",
  ruby_tshirt: "Developers T-Shirt",

  solidus_logo_hoodie: "Oversized Logo Hoodie",
  solidus_monogram_hoodie: "Monogram Hoodie",
  ruby_hoodie: "Monogram Hoodie - Ruby",

  solidus_beanie: "Geek Beanie",
  ruby_cap: "Developers Cap",

  solidus_tote: "Cotton Tote - Solidus",
  ruby_tote: "Cotton Tote - Ruby",

  solidus_water_bottle: "Insulated Water Bottle - Solidus",
  ruby_water_bottle: "Insulated Water Bottle - Ruby"
}

products.each do |key, name|
  products[key] = Spree::Product.find_by!(name: name)
end

taxons = [
  {
    name: "Categories",
    taxonomy: categories,
    position: 0
  },
  {
    name: "Clothing",
    taxonomy: categories,
    parent: "Categories"
  },
  {
    name: "Accessories",
    taxonomy: categories,
    parent: "Categories"
  },
  {
    name: "Water Bottles",
    taxonomy: categories,
    parent: "Categories"
  },
  {
    name: "Caps",
    taxonomy: categories,
    parent: "Accessories",
    position: 1,
    products: [
      products[:solidus_beanie],
      products[:ruby_cap]
    ]
  },
  {
    name: "Totes",
    taxonomy: categories,
    parent: "Accessories",
    position: 2,
    products: [
      products[:solidus_tote],
      products[:ruby_tote]
    ]
  },
  {
    name: "Water Bottles",
    taxonomy: categories,
    parent: "Water Bottles",
    position: 3,
    products: [
      products[:solidus_water_bottle],
      products[:ruby_water_bottle]
    ]
  },
  {
    name: "T-Shirts",
    taxonomy: categories,
    parent: "Clothing",
    products: [
      products[:ruby_tshirt],
      products[:solidus_monogram_tshirt],
      products[:solidus_logo_tshirt]
    ],
    position: 0
  },
  {
    name: "Hoodies",
    taxonomy: categories,
    parent: "Clothing",
    position: 0,
    products: [
      products[:solidus_logo_hoodie],
      products[:solidus_monogram_hoodie],
      products[:ruby_hoodie]
    ]
  },
  {
    name: "Brands",
    taxonomy: brands
  },
  {
    name: "Solidus Apparel",
    taxonomy: brands,
    parent: "Brand",
    products: [
      products[:solidus_logo_hoodie],
      products[:solidus_monogram_hoodie],
      products[:solidus_monogram_tshirt],
      products[:solidus_logo_tshirt],
      products[:solidus_beanie],
      products[:solidus_water_bottle],
      products[:solidus_tote]
    ]
  },
  {
    name: "Ruby Apparel",
    taxonomy: brands,
    parent: "Brand",
    products: [
      products[:ruby_tshirt],
      products[:ruby_hoodie],
      products[:ruby_cap],
      products[:ruby_water_bottle],
      products[:ruby_tote]
    ]
  }
]

taxons.each do |taxon_attrs|
  if taxon_attrs[:parent]
    taxon_attrs[:parent] = Spree::Taxon.find_by!(name: taxon_attrs[:parent])
    Spree::Taxon.create!(taxon_attrs)
  end
end
