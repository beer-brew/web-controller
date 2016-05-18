class DeviceRegisterJob < ApplicationJob
  queue_as :default
  
  def perform(id)
    ActionCable.server.broadcast 'register_channel', id: id 
  end
end
