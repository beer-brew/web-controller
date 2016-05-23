class ConnectionSetupJob < ApplicationJob
  queue_as :default

  def perform(device)
   device.connections.map(&:setup)
  end
end
