## Beer Brewer

this is dashboard/control panel to for all the statuses in a brew system.

it need:

  # esp8266 wifi board with code https://github.com/ripple0328/wifi-brew running in it
  # a ds18b20 digital temperature sensor connected to gpio 3
  # a relay connected to  VN, GND  and gpio 4
  # a button connected to  VCC, GND and gpio 1 
  
## Run
      brew install mosquitto
      bundle install
      ./bin/rails db:migrate
      foreman s

##  dashboard
  visit http://localhost:3000