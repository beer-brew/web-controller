tmr.alarm(0, 2000, 1, function()
  client:publish("/$CHIP_ID/$PIN",attr_config["sensor"].read(),0,0, function(conn) end)
end)
