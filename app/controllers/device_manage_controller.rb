class DeviceManageController < ApplicationController
  def index
    @unwired_devices = Device.unwired_devices
    @wired_devices = Device.wired_devices
    @connection_types = ConnectionType.all
  end
end
