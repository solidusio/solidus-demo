source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.3'

gem 'appmap', group: %i[test development]

gem 'rails', '~> 6.1'
# Use pg as the database for Active Record
gem 'pg'
# Use Puma as the app server
gem 'puma'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby
# Using RackAttack for security
gem 'rack-attack'

gem 'solidus_core'
gem 'solidus_api'
gem 'solidus_backend'
gem 'solidus_sample'
gem "solidus_starter_frontend", git: 'https://github.com/nebulab/solidus_starter_frontend'
gem "solidus_user_guides", git: 'https://github.com/seand7565/solidus_user_guides'
gem "solidus_paypal_commerce_platform", git: 'https://github.com/nebulab/solidus_paypal_commerce_platform'
gem "solidus_stripe", git: 'https://github.com/solidusio/solidus_stripe'
gem "solidus_graphql_api", git: 'https://github.com/solidusio-contrib/solidus_graphql_api'

group :heroku do
  gem 'cloudinary', '~> 1.11'
  gem 'paperclip-cloudinary'
  gem "sentry-raven"
end

# Use rspec for testing
gem 'rspec-rails'

# Use bootstrap for modals
gem 'bootstrap', '~> 4.4.1'
gem 'jquery-rails'

# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 5.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# CORS policy
gem 'rack-cors', '~> 1.1'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rb-readline'
  gem 'binding_of_caller'
  gem 'pry'
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing
  gem 'capybara', '>= 2.15'
  gem 'apparition'
  gem 'factory_bot'
  gem 'rspec_junit_formatter'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
