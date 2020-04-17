# frozen_string_literal: true

require 'rails_helper'

describe 'admin validation', type: :feature do

  before(:all) do
    Spree::Role.create(name:"admin")
  end

  it "should allow regular users into admin" do
    visit '/admin/orders'
    expect(page.current_path).to eq '/admin/orders'
  end

  it "should not allow adjusting records on admin" do
    visit '/admin/users/new'
    click_on("commit")
    expect(page).to have_content "Records can't be adjusted on the sample admin"
  end
end
