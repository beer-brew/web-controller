class DeviceRegisterJob < ApplicationJob
  queue_as :default
  
  def perform(msg)
    p 'register job'
    ap Device.find(chip_id: msg['id'])
    d = Device.find_or_create_by(chip_id: msg['id']) do |d| 
      d.ip = msg['ip']
      d.mac_address = msg['mac']
      d.ssid = msg['ssid']
      d.status = :online
    end
    ap Device.all
    ActionCable.server.broadcast 'register_channel', msg: msg
  end
end
