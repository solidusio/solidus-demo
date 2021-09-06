# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'sample changes', type: :feature do
  let(:product) { create(:product) }

  before(:each) do
    Spree::Role.create(name:"admin")
  end

  it "allows creating records on admin" do
    visit '/admin/shipping_categories/new'

    fill_in "Name", with: SecureRandom.hex
    click_on("commit")

    expect(page).to have_content "has been successfully created"
    expect(Spree::ShippingCategory.unscoped.last.sample_indicator_id).to_not be_nil
  end

  it "allows editing of existing records on admin" do
    new_product_name = product.name + "adjustment"
    visit "/admin/products/#{product.id}"

    fill_in "Name", with: new_product_name
    click_on("Update")

    expect(page).to have_content new_product_name
  end

  it "saves changes for sample products in a separate table" do
    new_product_name = product.name + "adjustment"
    visit "/admin/products/#{product.id}"

    fill_in "Name", with: new_product_name
    click_on("Update")

    expect(Spree::SampleChanges.unscoped.last.changed_data["name"]).to eq new_product_name
    expect(product.name).to_not eq new_product_name
  end

end
