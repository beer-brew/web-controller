class TemperatureUpdateJob < ApplicationJob
  queue_as :default

  def perform(data)
    Temperature.create(sensor_id: data['id'], temperature: data['temperature'].to_f)
  end
end
