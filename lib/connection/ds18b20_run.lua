tmr.alarm(0, 2000, 1, function()
            sensor = {}
            sensor["lng"] = attr_config["lng"] 
            sensor["lat"] = attr_config["lat"]
            sensor["id"] =  attr_config["id"] 
            sensor["name"] = attr_config["name"]
            sensor["time"], usec = rtctime.get() 
            sensor["value"] = attr_config["sensor"].read
  client:publish("/$CHIP_ID/$PIN",cjson.endcode(sensor), 0,0)
end)
