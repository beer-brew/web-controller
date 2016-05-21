class RegisterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "register_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def connected(payload)
    if(payload['source_connection_type'] and payload['target_device_id'])
      device = Device.find(payload['target_device_id'])
      device.first_pin.create_connection(connection_type_id: payload['source_connection_type'])
      SendConnectionDriverJob.perform_later(device)
    end
  end
end
