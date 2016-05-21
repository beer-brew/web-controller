class StagePlayBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    stage = Ongoing.stage
    ActionCable.server.broadcast 'stage_play_channel', stage: stage
    run_device(stage) 
  end
  private

  def run_device(stage)
    stage.devices.map(&:clazz).map(&:run) 
  end
end
