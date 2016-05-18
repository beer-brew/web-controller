class RegisterChannel < ApplicationCable::Channel
  def subscribed
    stream_from "register_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
