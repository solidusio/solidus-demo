# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'admin validation', type: :feature do

  before(:each) do
    Spree::Role.create(name:"admin")
  end

  it "allows regular users into admin" do
    visit '/admin/orders'

    expect(page.current_path).to eq '/admin/orders'
  end
end
