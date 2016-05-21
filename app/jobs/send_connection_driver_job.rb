class SendConnectionDriverJob < ApplicationJob
  queue_as :default

  def perform(device)
   device.conn.class_name.constantize.setup
  end
end
