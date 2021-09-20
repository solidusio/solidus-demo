# frozen_string_literal: true

products =
  {
    "Cotton Tote - Solidus" =>
    {
      "Type" => "Tote",
      "Size" => %{15" x 18" x 6"},
      "Material" => "Canvas"
    },
    "Cotton Tote - Ruby" =>
    {
      "Type" => "Tote",
      "Size" => %{15" x 18" x 6"},
      "Material" => "Canvas"
    },
    "Geek Beanie" =>
    {
      "Type" => "Beanie",
      "Size" => "One Size",
      "Material" => "100% Wool"
    },
    "Developers Cap" =>
    {
      "Type" => "Cap",
      "Size" => "One Size",
      "Material" => "100% Cotton"
    },
    "Premium Cotton T-Shirt" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Solidus",
      "Model" => "TL9002",
      "Shirt Type" => "Ringer T",
      "Sleeve Type" => "Short",
      "Made from" => "100% Cotton",
      "Fit" => "Loose",
      "Gender" => "Unisex"
    },
    "Logo T-Shirt" =>
    {
      "Manufacturer" => "Wilson",
      "Brand" => "Solidus",
      "Model" => "TL9002",
      "Shirt Type" => "Jersey",
      "Sleeve Type" => "Long",
      "Made from" => "100% cotton",
      "Fit" => "Loose",
      "Gender" => "Unisex"
    },
    "Developers T-Shirt" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Ruby",
      "Model" => "TL9002",
      "Shirt Type" => "Ringer T",
      "Sleeve Type" => "Short",
      "Made from" => "100% Cotton",
      "Fit" => "Loose",
      "Gender" => "Unisex"
    },
    "Oversized Logo Hoodie" =>
    {
      "Manufacturer" => "Jerseys",
      "Brand" => "Solidus",
      "Model" => "HD9001",
      "Shirt Type" => "Jersey",
      "Sleeve Type" => "Long",
      "Made from" => "100% cotton",
      "Fit" => "Loose",
      "Gender" => "Unisex"
    },
    "Monogram Hoodie" =>
    {
      "Manufacturer" => "Wilson",
      "Brand" => "Solidus",
      "Model" => "HD2001",
      "Shirt Type" => "Baseball",
      "Sleeve Type" => "Long",
      "Made from" => "90% Cotton, 10% Nylon",
      "Fit" => "Loose",
      "Gender" => "Unisex"
    },
    "Monogram Hoodie - Ruby" =>
    {
      "Manufacturer" => "Wilson",
      "Brand" => "Ruby",
      "Model" => "HD2001",
      "Shirt Type" => "Baseball",
      "Sleeve Type" => "Long",
      "Made from" => "90% Cotton, 10% Nylon",
      "Fit" => "Loose",
      "Gender" => "Unisex"
    },
    "Insulated Water Bottle - Solidus" =>
    {
      "Type" => "Insulated Water Bottle",
      "Size" => %{4.5" tall, 3.25" dia.}
    },
    "Insulated Water Bottle - Ruby" =>
    {
      "Type" => "Insulated Water Bottle",
      "Size" => %{4.5" tall, 3.25" dia.}
    }
  }

products.each do |name, properties|
  product = Spree::Product.find_by(name: name)
  properties.each do |prop_name, prop_value|
    product.set_property(prop_name, prop_value)
  end
end
