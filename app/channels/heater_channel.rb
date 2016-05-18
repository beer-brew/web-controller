# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class HeaterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "heater_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def switch
    if Heater.last
      Heater.create status: !Heater.last.status
    end
  end
end
