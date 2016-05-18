Thread.new do
  Rails.application.config.mqtt_client.get('/register') do |topic,message|
    TemperatureUpdateJob.perform_later(JSON.parse(message))
  end
end
