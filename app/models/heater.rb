class Heater < ApplicationRecord
  after_create_commit do
    HeaterStatusBroadcastJob.perform_later(self)
    publish_to_mqtt
  end

  private
  def publish_to_mqtt
    string_status = self.status ? "On" : "Off"
    Rails.application.config.mqtt_client.publish('/heater', string_status,retain=true)
  end
end

