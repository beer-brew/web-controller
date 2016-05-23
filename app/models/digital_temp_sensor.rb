class DigitalTempSensor < Connection 
  def setup_file 
    'ds18b20'
  end
  def run_file
    'ds18b20'
  end

  def custom_values
    {} 
  end

  def setup
    config_driver
  end
  def run
    run_code 
  end
  def self.to_value(value)
   value.round(1) 
  end
end

