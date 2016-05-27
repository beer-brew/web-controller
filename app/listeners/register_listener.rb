class RegisterListener
  def self.listen
    Rails.application.config.mqtt_client.get('/register') do |_,message|
      DeviceRegisterJob.perform_later(JSON.parse(message))
    end
  end
end
