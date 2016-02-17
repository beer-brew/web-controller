class TemperatureChannel < ApplicationCable::Channel
  def subscribed
    stream_from "temperature_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
