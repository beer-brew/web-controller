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
      conn_type = ConnectionType.find(payload['source_connection_type'])
      pin_id = device.pins.first.id
      conn_type.class_name.constantize.create(connection_type_id:  conn_type.id, pin_id: pin_id)
      Pin.find(pin_id).update(pin_type: conn_type.io_type)
      ConnectionSetupJob.perform_later(device)
    end
  end
end
