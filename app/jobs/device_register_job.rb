class DeviceRegisterJob < ApplicationJob
  queue_as :default
  
  def perform(msg)
    d = Device.find_or_create_by(chip_id: msg['id']) do |d| 
      d.ip = msg['ip']
      d.mac_address = msg['mac']
      d.ssid = msg['ssid']
      d.status = :online
    end
    d.pins.create(pin_number: 2)
    ActionCable.server.broadcast 'register_channel', id: d.id, body: render_body(d) 
  end

  private
  def render_body(device)
    ApplicationController.renderer.render(partial: 'device_manage/device', locals: {device: device})
  end
end
