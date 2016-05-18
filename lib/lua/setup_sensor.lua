t = require("driver")
sensor_pin = 2 
gpio.mode(2,  gpio.INPUT)

-- ESP-01 GPIO Mapping
t.setup(sensor_pin)
addrs = t.addrs()
if (addrs ~= nil) then
  print("Total DS18B20 sensors: "..table.getn(addrs))
end

-- Just read temperature
print("Temperature: "..t.read().."'C")
S = {}
attr_config["sensor"] = t

