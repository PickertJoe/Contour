require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Contour
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.mapbox_token = "pk.eyJ1IjoiZGlsYmVydDI1MCIsImEiOiJjazE2eG41N2cxMjVhM2NsYnFtYXBucWM0In0.qjQFUix7bPaSwLZ8IskknA"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
