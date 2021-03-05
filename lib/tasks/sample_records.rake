# frozen_string_literal: true

namespace :sample_records do
  days = 1

  desc "This task will remove all (specified) sample records on the application older than #{days} days."
  task remove: :environment do
    columns_to_check = [Spree::Product, Spree::Order]

    columns_to_check.each do |objects|
      objects.unscoped.where.not(sample_indicator_id: nil).where('updated_at < ?', DateTime.now - days).destroy_all
    end
  end
end
