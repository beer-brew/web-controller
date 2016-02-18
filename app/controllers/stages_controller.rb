class StagesController < ApplicationController
  def index
    @stages = Stage.all
    @current_stage = Ongoing.first.try(:stage)
  end
end
