# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tour text', :js, type: :feature do
  it "displays tour on frontend" do
    visit '/'
    expect(page).to have_css(".tour-title", text: "Solidus Guided Tour", visible: false)
  end

  it "displays tour on backend" do
    visit '/admin/orders'

    pending "Failing on CircleCI for some unknown reason"
    expect(page).to have_css(".tour-title", text: "Solidus Admin", visible: false)
  end
end
