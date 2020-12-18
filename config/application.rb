require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module SolidusDemo
  class Application < Rails::Application
    # Load application's model / class decorators
    initializer 'spree.decorators' do |app|
      config.to_prepare do
        Dir.glob(Rails.root.join('app/**/*_decorator*.rb')) do |path|
          require_dependency(path)
        end
      end
    end

    # Load application's view overrides
    initializer 'spree.overrides' do |app|
      config.to_prepare do
        Dir.glob(Rails.root.join('app/overrides/*.rb')) do |path|
          require_dependency(path)
        end
      end
    end

    # Load application's lib supplements
    Dir.glob(File.join(File.dirname(__FILE__), "../lib/**/*.rb")) do |c|
      ActiveSupport::Dependencies.require_or_load(File.expand_path(c))
    end

    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end

# Load prependers automatically from app/prependers.
Prependers.setup_for_rails(namespace: SolidusDemo)
