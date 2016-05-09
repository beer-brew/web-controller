Thread.new do
  MQTT::Client.connect(host: 'm10.cloudmqtt.com', port: '12948', username: 'qegbzezg', password: 'GaD8XPkgNZMH') do |c|
    c.get('/temperature') do |topic,message|
      TemperatureUpdateJob.perform_later(JSON.parse(message))
    end
  end
end
