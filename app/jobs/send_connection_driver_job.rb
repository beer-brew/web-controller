class SendConnectionDriverJob < ApplicationJob
  queue_as :default

  def perform(device)
    c = Connection.find(deivce.pins.first.connection_id)
    setup_code = IO.read("lib/connection/#{c.setup}_setup.lua").gsub(/\$PIN/, device.pins.first.pin_number) 
    Rails.application.config.mqtt_client.publish("/setup/#{device.chip_id}", setup_code, retain=false)
  end
end
