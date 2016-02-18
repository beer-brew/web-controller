class StagesController < ApplicationController
  def index
    @stages = Stage.all
  end
end
