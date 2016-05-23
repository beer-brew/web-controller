require './lib/listeners/register_listener'
require './lib/listeners/sensors_listener'
Thread.new do
  RegisterListener.listen
end
Thread.new do
  SensorsListener.listen
end
