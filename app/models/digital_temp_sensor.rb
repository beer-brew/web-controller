class DigitalTempSensor < Connection 
  default_scope { where.class_name == 'DigitalTempSensor' } 
  
  def setup_file 
    'ds18b20'
  end
  def run_file
    'ds18b20'
  end

  def custom_values
    {} 
  end

end
