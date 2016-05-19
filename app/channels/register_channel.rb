class RegisterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "register_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def connected(payload)
    if(payload['source_connection_id'] and payload['target_device_id'])
      connection = Connection.find(payload['source_connection_id'])
      pin = Device.find(payload['target_device_id'].to_i).pins.first
      pin.update(connection_id: connection.id)
    end
  end
end
