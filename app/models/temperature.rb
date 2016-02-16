class Temperature < ApplicationRecord
  after_create_commit do
    TemperatureBroadcastJob.perform_later(self)
    temperature_trigger
  end

  private
  def temperature_trigger
    if temperature > 26 && Heater.last.status == true
      Heater.create status: false
    elsif temperature < 26 && Heater.last.status == false
      Heater.create status: true
    end
  end
end
