tmr.alarm(0, 2000, 1, function()
  response = {}
  response["id"] = node.chipid()
  response["temperature"] = attr_config["sensor"].read()
  client:publish("temperature",cjson.encode(response),0,0, function(conn) end)
end)
