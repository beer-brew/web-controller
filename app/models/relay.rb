class Relay < Connection 
  def setup
   publish_code('relay_setup') 
  end
  def run
  end

  def exec(result)
    @value = to_value  
    if to_value(connection_data.order(id: :desc).second) != @value
      display_value = @value ? 1 : 0
      ConnectionDatum.create(value: display_value, time: DateTime.now, connection_id: id, name: name.gsub(' ', '-')) 
      run_code
    end
  end

  def custom_values
    {
      '$VALUE' => @value 
    }
  end

  def to_value(value)
    !!value ? 'HIGH' : 'LOW'
  end
end
