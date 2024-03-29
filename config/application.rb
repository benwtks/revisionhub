require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RevisionHub
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    config.generators do |generator|
        generator.orm :active_record, primary_key_type: :uuid
    end

    config.to_prepare do
        Devise::SessionsController.layout "devise"
        Devise::Mailer.layout "mailer"
    end
  end
end
