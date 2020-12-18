# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'stock item lock', type: :feature do
  it 'works on sample data with unpersisted changes' do
    stock_item = create(:stock_item)
    stock_item.backorderable = false

    expect { stock_item.adjust_count_on_hand(12) }.to change { stock_item.count_on_hand }.by 12
  end

  it 'fails on user created data with unpersisted changes' do
    stock_item = create(:stock_item)
    stock_item.update(sample_indicator_id: Random.hex)
    stock_item.backorderable = false

    expect { stock_item.adjust_count_on_hand(12) }.to raise_error(RuntimeError)
  end
end
