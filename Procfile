db: mysqld
web: ./bin/rails s -p 3000 -b 0.0.0.0
register_listener: ./bin/rails runner 'RegisterListener.listen'
sensor_listener: ./bin/rails runner 'SensorsListener.listen'
