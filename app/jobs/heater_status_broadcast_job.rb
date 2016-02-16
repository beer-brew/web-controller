class HeaterStatusBroadcastJob < ApplicationJob
  queue_as :default

  def perform(heater)
    ActionCable.server.broadcast 'heater_channel', heater: render_heater(heater)
  end

  private
  def render_heater(heater)
    ApplicationController.renderer.render(partial: 'status/heater', locals: {heater: heater})
  end
end
