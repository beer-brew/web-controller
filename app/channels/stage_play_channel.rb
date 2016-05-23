# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class StagePlayChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stage_play_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def reset
    Ongoing.first_or_create.update(stage: 0)
  end

  def play_stage(stage)
    Ongoing.first_or_create.update(stage: stage['stage'])
  end
end
