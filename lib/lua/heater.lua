function onMessage(conn, topic, data)
  if data ~= nil and topic == 'heater' then
    print(topic..":"..data)
    if data=='Off' then
        gpio.write(light_pin,gpio.LOW);
        gpio.write(relay_pin,gpio.HIGH);
    else 
        gpio.write(light_pin,gpio.HIGH);
        gpio.write(relay_pin,gpio.LOW);
    end
  end
end
client:on("message", onMessage)
