class DeviceManageController < ApplicationController
  def index
    @devices = Device.all
  end
end
