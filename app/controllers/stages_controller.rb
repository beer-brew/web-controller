class StagesController < ApplicationController
  def index
    @stages = Stage.all
    @devices = Device.all
    @current_stage = Ongoing.first.try(:stage)
  end
end
