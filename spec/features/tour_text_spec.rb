# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'tour text', :js, type: :feature do
  it 'displays tour on frontend' do
    visit '/'

    expect(page).to have_content('Guided Tour')
  end

  it 'displays tour on backend' do
    visit '/admin'

    expect(page).to have_content('Guided Tour')
  end
end
