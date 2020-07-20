# frozen_string_literal: true

require 'rails_helper'

describe 'tour text', type: :feature do

  it "displays tour on frontend" do
    visit '/'
    expect(page).to have_css(".tour-title", text: "Solidus Guided Tour", visible: false)
  end

  it "displays tour on backend" do
    visit '/admin/orders'
    expect(page).to have_css(".tour-title", text: "Solidus Admin", visible: false)
  end
end
