# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SolidusGraphqlApi::Context do
  describe '#current_user' do
    context 'when authorization token is given' do
      it 'returns solidus demo user' do
        request = Struct.new(:headers).new('Authorization' => 'Bearer 123')
        context = described_class.new(request: request)

        expect(context.current_user).to eq(Spree::LegacyUser.solidus_demo_user('123'))
      end
    end

    context 'when guest token is given' do
      it 'returns solidus demo user' do
        request = Struct.new(:headers).new('X-Spree-Order-Token' => '123')
        context = described_class.new(request: request)

        expect(context.current_user).to eq(Spree::LegacyUser.solidus_demo_user('123'))
      end
    end

    context 'when no token is given' do
      it 'returns nil' do
        request = Struct.new(:headers).new({})
        context = described_class.new(request: request)

        expect(context.current_user).to be(nil)
      end
    end
  end
end
