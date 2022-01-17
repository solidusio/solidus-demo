# frozen_string_literal: true

Spree::Sample.load_sample("products")
Spree::Sample.load_sample("variants")

products = {}
products[:solidus_monogram_tshirt] = Spree::Product.includes(variants: [:option_values]).find_by!(name: "Premium Cotton T-Shirt")
products[:solidus_logo_tshirt] = Spree::Product.includes(variants: [:option_values]).find_by!(name: "Logo T-Shirt")
products[:ruby_tshirt] = Spree::Product.includes(variants: [:option_values]).find_by!(name: "Developers T-Shirt")
products[:solidus_logo_hoodie] = Spree::Product.includes(variants: [:option_values]).find_by!(name: "Oversized Logo Hoodie")
products[:solidus_monogram_hoodie] = Spree::Product.includes(variants: [:option_values]).find_by!(name: "Monogram Hoodie")

products[:ruby_hoodie] = Spree::Product.find_by!(name: "Monogram Hoodie - Ruby")
products[:solidus_beanie] = Spree::Product.find_by!(name: "Geek Beanie")
products[:ruby_cap] = Spree::Product.find_by!(name: "Developers Cap")
products[:solidus_tote] = Spree::Product.find_by!(name: "Cotton Tote - Solidus")
products[:ruby_tote] = Spree::Product.find_by!(name: "Cotton Tote - Ruby")
products[:solidus_water_bottle] = Spree::Product.find_by!(name: "Insulated Water Bottle - Solidus")
products[:ruby_water_bottle] = Spree::Product.find_by!(name: "Insulated Water Bottle - Ruby")

def image(name, type = "jpg")
  images_path = Pathname.new(Rails.root.join("db/samples/images"))
  path = images_path + "#{name}.#{type}"

  return false if !File.exist?(path)

  path
end

images = {
  products[:solidus_monogram_tshirt].master => [
    {
      attachment: image("solidus_monogram_tshirt")
    }
  ],
  products[:solidus_logo_tshirt].master => [
    {
      attachment: image("solidus_logo_tshirt")
    }
  ],
  products[:ruby_tshirt].master => [
    {
      attachment: image("ruby_tshirt")
    }
  ],
  products[:solidus_logo_hoodie].master => [
    {
      attachment: image("solidus_logo_hoodie")
    }
  ],
  products[:solidus_monogram_hoodie].master => [
    {
      attachment: image("solidus_monogram_hoodie")
    }
  ],
  products[:ruby_hoodie].master => [
    {
      attachment: image("ruby_hoodie")
    }
  ],
  products[:solidus_beanie].master => [
    {
      attachment: image("solidus_beanie")
    }
  ],
  products[:ruby_cap].master => [
    {
      attachment: image("ruby_cap")
    }
  ],
  products[:solidus_tote].master => [
    {
      attachment: image("solidus_tote")
    }
  ],
  products[:ruby_tote].master => [
    {
      attachment: image("ruby_tote")
    }
  ],
  products[:solidus_water_bottle].master => [
    {
      attachment: image("solidus_water_bottle")
    }
  ],
  products[:ruby_water_bottle].master => [
    {
      attachment: image("ruby_water_bottle")
    }
  ]
}

products.each do |key, product|
  product.reload.variants.each do |variant|
    color = variant.option_value("clothing-color").downcase
    main_image = image("#{key}_#{color}", "jpg")
    next if !main_image

    File.open(main_image) do |f|
      variant.images.create!(attachment: f)
    end
  end
end

images.each do |variant, attachments|
  puts "Loading images for #{variant.product.name}"
  attachments.each do |attachment|
    File.open(attachment[:attachment]) do |f|
      variant.images.create!(attachment: f)
    end
  end
end
