class StagePlayBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    stage = Ongoing.stage
    ActionCable.server.broadcast 'stage_play_channel', stage: stage ? stage : 0
    run_device(stage) if stage 
  end
  private

  def run_device(stage)
    [stage.input, stage.stop].flatten.uniq.map(&:connections).flatten.map(&:run)
  end
end
