class StagesController < ApplicationController
  def index
    @stages = Stage.all
    @input_devices = Device.with_type('input')
    @output_devices = Device.with_type('output')
    @current_stage = Ongoing.first.try(:stage)
  end
end
