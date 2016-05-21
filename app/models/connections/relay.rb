class Relay < Connection 
  default_scope { where.class_name == 'Relay' } 

  def setup_file 
    'relay'
  end
  def run_file
    'relay'
  end

  def setup
    config_driver
  end

  def run
  end

  def exec(result)
    @value = ressult ? 'HIGH' : 'LOW' 
    if clazz.connection_data.last.to_value != @value
      display_value = result ? 1 : 0
      ConnectionData.create(value: display_value, time: DateTime.now, connection_id: id, name: name.gsub(' ', '-')) 
      run_code
    end
  end

  def custom_values
    {
      '$VALUE' => @value 
    }
  end

  def self.to_value(value)
    value.round(1) 
  end
end
