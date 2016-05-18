class DeviceRegisterJob < ApplicationJob
  queue_as :default
  
  def perform(msg)
    Device.find_or_create_by(chip_id: msg.chip_id) do |d| 
      d.ip = msg.ip
      d.mac_address = msg.mac
      d.ssid = msg.ssid
    end
    ActionCable.server.broadcast 'register_channel', id: msg.id 
  end
end
