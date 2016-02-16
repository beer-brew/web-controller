class StatusController < ApplicationController
  def index
    @temperature = Temperature.last
    @heater = Heater.last
  end
end
