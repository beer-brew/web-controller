class SensorsListener
  def self.listen
    Rails.application.config.mqtt_client.get('/connections/+/data') do |_,message|
      ConnectionData.create(JSON.parse(message))
    end
 end 
end
