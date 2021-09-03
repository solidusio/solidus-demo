# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Spree::LegacyUser do
  describe '.solidus_demo_user' do
    it 'returns an instance of LegacyUser' do
      expect(described_class.solidus_demo_user('token')).to be_a(described_class)
    end

    it 'populates spree_api_key' do
      expect(described_class.solidus_demo_user('token').spree_api_key).to eq('token')
    end
  end
end
