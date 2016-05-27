data_id = 0
tmr.alarm(0, 2000, 1, function()
            sensor = {}
            sensor["lng"] = attr_config["lng"] 
            sensor["lat"] = attr_config["lat"]
            sensor["data_id"] = data_id
            data_id = data_id + 1 
            sensor["connection_id"] =  attr_config["connection_id"] 
            sensor["name"] = attr_config["name"]
            sensor["time"], usec = rtctime.get() 
            sensor["value"] = attr_config["sensor"].read
  client:publish("/connections/$NAME/data",cjson.endcode(sensor), 0,0)
end)
