class Lua
  def exe
    lua_str = IO.read('lib/lua/setup_sensor.lua')
    p lua_str
    Rails.application.config.mqtt_client.publish('/setup/972483', lua_str, retain=false)
    sleep 4
    lua_str = IO.read('lib/lua/broadcast_temperature.lua')
    p lua_str
    Rails.application.config.mqtt_client.publish('/run/972483', lua_str, retain=false)
  end
end

