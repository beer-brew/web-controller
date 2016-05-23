class DigitalTempSensor < Connection 
  def setup_file 
    'ds18b20'
  end
  def run_file
    'ds18b20'
  end

  def setup
    config_driver
  end
  def run
    run_code 
  end

  def eval(data)
    eval("#{data.to_value} #{logic}")
  end
  
  def to_value(value)
   value.to_f.round(1) 
  end
end

