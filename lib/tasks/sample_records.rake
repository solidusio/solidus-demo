# frozen_string_literal: true

namespace :sample_records do
  days = 1

  task appmap: :environment do
    store = Spree::Store.find_by_name('Sample Store')
    unless store
      warn "'Sample Store' not found. It's probably already been converted to 'AppMap Store'"
      next
    end

    store.name = 'AppMap Store'
    store.url = 'store.appmap.io'
    store.mail_from_address = 'store@appmap.io'
    store.code = 'appmap-store'
    store.save!
  end

  desc "This task will remove all (specified) sample records on the application older than #{days} days."
  task remove: :environment do
    columns_to_check = [Spree::Product, Spree::Order]

    columns_to_check.each do |objects|
      objects.unscoped.where.not(sample_indicator_id: nil).where('updated_at < ?', DateTime.now - days).destroy_all
    end
  end
end
