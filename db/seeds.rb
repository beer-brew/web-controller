# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Connection.create(name: "Temperature Sensor", catagory: :analog, io_type: :input, icon: 'temp_sensor_analog')
Connection.create(name: "Temperature Sensor", catagory: :gpio, setup: 'ds18b20', io_type: :input, icon: 'temp_sensor_digital')
Connection.create(name: "Air Quality Sensor", catagory: :analog, io_type: :input, icon: 'air_quality')
Connection.create(name: "Humidity Sensor", catagory: :gpio, io_type: :input, icon: 'humidity_sensor')
Connection.create(name: "Light", catagory: :gpio, io_type: :output, icon: 'light')
Connection.create(name: "UV sensor", catagory: :gpio, io_type: :input, icon: 'uv_sensor')
