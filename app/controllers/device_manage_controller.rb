class DeviceManageController < ApplicationController
  def index
    @wired_devices = Device.actual.wired
    @unwired_devices = Device.actual - @wired_devices
    @connection_types = ConnectionType.where.not(name: 'timer')
  end
end
