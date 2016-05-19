class DeviceManageController < ApplicationController
  def index
    @devices = Device.all
    @connections = Connection.all
  end
end
