class StagePlayBroadcastJob < ApplicationJob
  queue_as :default

  def perform(ongoing)
    ActionCable.server.broadcast 'stage_play_channel', stage: ongoing.stage
    stage = Stage.find(ongoing.stage)
    config_input_device(stage) 
    config_stop_device(stage)
  end
  private
  def config_input_device(stage)
    input_device = Device.find(stage.input_device)
    c = Connection.find(input_deivce.pins.first.connection_id)
    run_code = IO.read("lib/connection/#{c.run}_run.lua").gsub(/\$CHIP_ID/, input_device.chip_id).gsub(/\$PIN/, input_device.pins.first.pin_number) 
    Rails.application.config.mqtt_client.publish("/run/#{input_device.chip_id}", run_code, retain=false) unless run_code.empty?
    Rails.application.config.mqtt_client.get("/#{input_device.chip_id}/#{input_device.pins.first.pin_number}") do |_, message|
      OutputEvaludateJob.perform_later(message, stage.output_logic, c.id, Device.find(stage.output_device))
    end
  end

  def config_stop_device(stage)
    stop_device = Device.find(stage.stop_device)
    c = Connection.find(input_deivce.pins.first.connection_id)
    run_code = IO.read("lib/connection/#{c.run}_run.lua") 
  end
end
