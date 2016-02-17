## Beer Brewer

this is dashboard/control panel to display or control all the statuses in a brew system.

althought it's a web application, it will update the status in realtime

it need:

  * esp8266 wifi board with code https://github.com/ripple0328/wifi-brew running in it
  * a ds18b20 digital temperature sensor connected to gpio 3
  * a relay connected to  VN, GND  and gpio 4
  * a button connected to  VCC, GND and gpio 1 
  
## Run
      brew install mosquitto
      bundle install
      ./bin/rails db:migrate
      foreman s

##  dashboard
  visit http://localhost:3000