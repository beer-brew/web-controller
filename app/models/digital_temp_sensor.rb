class DigitalTempSensor < Connection 
  def setup
    publish_code('ds18b20_setup') 
  end
  def run
    publish_code('ds18b20_run') 
  end

  def eval(data)
    eval("#{data.to_value} #{logic}")
  end
  
  def to_value(value)
   value.to_f.round(1) 
  end
end

