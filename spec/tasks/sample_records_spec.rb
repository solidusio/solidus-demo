# frozen_string_literal: true

require 'rails_helper'
require 'rake'

RSpec.describe 'sample_records:remove' do
  it 'destroys only records that are user generated and abandoned' do
    Rake.application.rake_require 'tasks/sample_records'
    # Disabling setting token on save, we're doing that here.
    allow_any_instance_of(Current).to receive(:token) { Random.hex }

    # User created product, abandoned
    create(:product).update(updated_at: 30.days.ago)
    # User created product, active
    create(:product)

    # To create sample data, we need to not use the token.
    allow_any_instance_of(Current).to receive(:token) { nil }

    # Sample data, abandoned
    create(:product).update(updated_at: 30.days.ago)

    expect { Rake::Task['sample_records:remove'].execute }
      .to change { Spree::Product.unscoped.without_deleted.count }.from(3).to(2)
  end
end
