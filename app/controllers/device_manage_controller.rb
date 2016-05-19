class DeviceManageController < ApplicationController
  def index
    all_device = Device.all.group_by{|d| d.pins.first.connection_id==nil}
    @devices = all_device[true]
    @components = all_device[false]
    @connections = Connection.all
  end
end
