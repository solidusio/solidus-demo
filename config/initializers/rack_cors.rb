# frozen_string_literal: true

Rails.application.config.middleware.insert_before 0, Rack::Cors do
  allow do
    origins [ENV['GRAPHQL_PLAYGROUND_ORIGIN']].compact
    resource '/graphql', headers: :any, methods: %i[post]
  end
end
