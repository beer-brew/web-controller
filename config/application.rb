require File.expand_path('../boot', __FILE__)

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module BeerBrewer
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    config.mqtt_client = MQTT::Client.connect(host: 'm10.cloudmqtt.com', port: '12948', username: 'qegbzezg', password: 'GaD8XPkgNZMH')
    config.active_record.time_zone_aware_types = [:time, :datetime]
  end
end
