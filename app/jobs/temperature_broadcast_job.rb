class TemperatureBroadcastJob < ApplicationJob
  queue_as :default

  def perform(temp)
    p 'perform job'
    ActionCable.server.broadcast 'temperature_channel', temperature: render_temp(temp)
  end

  private
  def render_temp(temp)
    ApplicationController.renderer.render(partial: 'status/temperature', locals: {temperature: temp})
  end
end
