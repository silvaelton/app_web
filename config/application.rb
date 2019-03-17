require_relative "boot"

require "rails"
# Include each railties manually, excluding `active_storage/engine`
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
# require "active_storage/engine"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
require "rails/test_unit/railtie"
require "dotenv"

Bundler.require(*Rails.groups)

Dotenv::Railtie.load

module AppWeb
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    config.time_zone = 'Brasilia'
    config.i18n.default_locale = :'pt-BR'
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s]

    config.assets.paths << Rails.root.join('vendor', 'libs')
    config.assets.paths << Rails.root.join('vendor', 'stylesheets')
    config.assets.paths << Rails.root.join('vendor', 'javascripts')

  end
end
