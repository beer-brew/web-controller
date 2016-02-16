Thread.new do
  MQTT::Client.connect('localhost') do |c|
    c.get('temperature') do |topic,message|
      TemperatureUpdateJob.perform_later(JSON.parse(message))
    end
  end
end