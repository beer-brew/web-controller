Thread.new do
  Rails.application.config.mqtt_client.get('/register') do |topic,message|
    DeviceRegisterJob.perform_later(message)
  end
end
