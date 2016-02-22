class Lua
  def exe
    lua_str = IO.read('lib/lua/setup_sensor.lua')
    Rails.application.config.mqtt_client.publish('/run/14016605', lua_str, retain=false)
    sleep 1
    lua_str = IO.read('lib/lua/broadcast_temperature.lua')
    Rails.application.config.mqtt_client.publish('/run/14016605', lua_str, retain=false)
  end
end

