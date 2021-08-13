# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GraphQL' do
  it 'can access through GraphQL' do
    create(:product, name: 'Demo product')

    post '/graphql', params: { query: '{ products { nodes { name } } }' }

    expect(JSON.parse(response.body)['data']['products']['nodes'][0]['name']).to eq('Demo product')
  end
end
