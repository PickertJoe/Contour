require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Contour
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    config.mapbox_token = "pk.eyJ1IjoiZGlsYmVydDI1MCIsImEiOiJjazE2eG41N2cxMjVhM2NsYnFtYXBucWM0In0.qjQFUix7bPaSwLZ8IskknA"

    config.stripe_secret_key: "sk_test_ZMVmBa1aORP4j0nY2grutQhT005Q5ax812"
    config.stripe_publishable_key: "pk_test_EkW4EWXKkupboL1FEEYYWeXy00rG8oRyEN"

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
