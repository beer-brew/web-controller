class SendConnectionDriverJob < ApplicationJob
  queue_as :default

  def perform(device)
   device.conn.class_name.constantize.config_driver
  end
end
