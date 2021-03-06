# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class StageChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stage_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def update(data)
    Stage.find(data['id']).update(data['field']=> data['value'])
  end

  def add_stage
    Stage.create
  end

  def select_device(payload)
    Stage.find(payload['stage_id']).update(payload['select_type'] => payload['device_id'])
  end
end
