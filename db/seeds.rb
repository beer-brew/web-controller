ConnectionType.create(name: "Temperature Sensor", class_name: 'AnalogTempSensor', catagory: :analog, io_type: :input, icon: 'temp_sensor_analog')
ConnectionType.create(name: "Temperature Sensor", class_name: 'DigitalTempSensor', catagory: :gpio,  io_type: :input, icon: 'temp_sensor_digital')
ConnectionType.create(name: "Air Quality Sensor", class_name: 'AirQualitySensor', catagory: :analog, io_type: :input, icon: 'air_quality')
ConnectionType.create(name: "Humidity Sensor", class_name: 'HumiditySensor', catagory: :gpio, io_type: :input, icon: 'humidity_sensor')
ConnectionType.create(name: "Light", class_name: 'Light', catagory: :gpio, io_type: :output, icon: 'light')
ConnectionType.create(name: "Relay", class_name: 'Relay', catagory: :gpio, io_type: :output,  icon: 'relay')
ConnectionType.create(name: "UV sensor", class_name: 'UVSensor', catagory: :gpio, io_type: :input, icon: 'uv_sensor')
ConnectionType.create(name: "Timer", class_name: 'Timer', catagory: :gpio, io_type: :input, icon: 'timer')
timer_pin1 = Device.create(chip_id: 1, status: 'online', ip:'localhost', mac_address: '00:00:00:00:00:00', ssid: 'timer').pins.create(pin_number: 2, pin_type: 'input') 
timer_pin2 = Device.create(chip_id: 2, status: 'online', ip:'localhost', mac_address: '00:00:00:00:00:00', ssid: 'timer').pins.create(pin_number: 2, pin_type: 'input') 
Timer.create(name: 'timer 1', connection_type_id: 8, pin_id: timer_pin1.id)
Timer.create(name: 'timer 2', connection_type_id: 8, pin_id: timer_pin2.id)
