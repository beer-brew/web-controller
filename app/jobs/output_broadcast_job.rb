class OutputBroadcastJob < ApplicationJob
  queue_as :default

  def perform(device, result)
    c = Connection.find(device.pins.first.connection_id)
    output = result ? 'HIGH' : 'LOW'
    run_code = IO.read("lib/connection/#{c.run}_run.lua").gsub(/\$OUTPUT/, output)
    Rails.application.config.mqtt_client.publish("/run/#{device.chip_id}", run_code, retain=false) unless run_code.empty?
  end
end
