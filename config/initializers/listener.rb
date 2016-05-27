Thread.new do
  RegisterListener.listen
end
Thread.new do
  SensorsListener.listen
end
