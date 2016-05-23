class StageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(stage)
    ActionCable.server.broadcast 'stage_channel', id: stage.id, stage: render_stage(stage)
  end

  private
  def render_stage(stage)
    ApplicationController.renderer.render(partial: 'stages/stage',
                                          locals: {
                                            stage: stage,
                                            input_devices: Device.wired & Device.with_type('input'),
                                            output_devices: Device.wired & Device.with_type('output'),
                                            current: Ongoing.stage
                                          }
                                         )
  end
end
