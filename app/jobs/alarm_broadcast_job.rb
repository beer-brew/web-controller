class AlarmBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    ActionCable.server.broadcast 'alarm_channel', audio: render_audio_tag
  end
  private
  def render_audio_tag
    ApplicationController.renderer.render(partial: 'stages/alarm')
  end
end
