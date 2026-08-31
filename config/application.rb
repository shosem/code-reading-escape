require_relative "boot"

require "rails"
require "active_model/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_view/railtie"

Bundler.require(*Rails.groups)

module CodeReadingEscape
  class Application < Rails::Application
    config.load_defaults 7.1

    config.time_zone = "Tokyo"
    config.i18n.default_locale = :en
    config.eager_load = false

    # This app is built for a workshop demo, so we keep the secret simple.
    # In a real app, use Rails credentials instead.
    config.secret_key_base =
      ENV.fetch("SECRET_KEY_BASE") { "development_secret_key_base_please_change_1234567890" }
  end
end
