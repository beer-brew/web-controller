class DeviceRegisterJob < ApplicationJob
  queue_as :default
  
  def perform(msg)
    d = Device.where(chip_id: msg['id']).first_or_create do |d| 
      d.ip = msg['ip']
      d.mac_address = msg['mac']
      d.ssid = msg['ssid']
      d.status = :online
    end
    ActionCable.server.broadcast 'register_channel', payload: msg
  end
end
