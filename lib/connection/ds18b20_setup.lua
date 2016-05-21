t = require("driver")
gpio.mode($PIN,  gpio.$IO_TYPE)
t.setup($PIN)
addrs = t.addrs()
if (addrs ~= nil) then
  print("Total DS18B20 sensors: "..table.getn(addrs))
end
print("Temperature: "..t.read().."'C")
S = {}
attr_config["sensor"] = t
attr_config["lng"] = 34.11
attr_config["lat"] = 108.52
attr_config["id"] =  $ID
attr_config["name"] = "$NAME"
