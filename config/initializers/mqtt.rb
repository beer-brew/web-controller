Thread.new do
  Rails.application.config.mqtt_client.get('/register') do |topic,message|
    DeviceRegisterJob.perform_later(message)
  end

  Rails.application.config.mqtt_client.get('/temperature') do |topic,message|
    TemperatureUpdateJob.perform_later(JSON.parse(message))
  end
end
HeardBeatJob.set(wait: 5.seconds).perform_later
