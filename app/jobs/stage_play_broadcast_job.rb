class StagePlayBroadcastJob < ApplicationJob
  queue_as :default

  def perform(ongoing)
    ActionCable.server.broadcast 'stage_play_channel', stage: ongoing.stage
  end
end
