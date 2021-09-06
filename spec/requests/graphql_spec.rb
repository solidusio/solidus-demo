# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GraphQL' do
  it 'can access through GraphQL' do
    create(:product, name: 'Demo product')

    post '/graphql', params: { query: '{ products { nodes { name } } }' }, headers: {}

    expect(JSON.parse(response.body)['data']['products']['nodes'][0]['name']).to eq('Demo product')
  end

  it 'scopes resources to the test user' do
    create(:store)
    post '/graphql', params: { query: 'mutation { createOrder(input: {}) { order { guestToken } } }' }, headers: {}
    guest_token = JSON.parse(response.body)['data']['createOrder']['order']['guestToken']

    post '/graphql', params: { query: '{ currentOrder { guestToken } }' }, headers: { 'X-Spree-Order-Token' => guest_token }
    expect(JSON.parse(response.body)['data']['currentOrder']).not_to be_nil

    post '/graphql', params: { query: '{ currentOrder { guestToken } }' }, headers: { 'X-Spree-Order-Token' => 'another_token' }
    expect(JSON.parse(response.body)['data']['currentOrder']).to be_nil
  end
end
