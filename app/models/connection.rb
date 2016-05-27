class Connection < ApplicationRecord
  has_many :connection_data 
  belongs_to :connection_type 
  belongs_to :pin
  before_save :set_default_values
  
  def set_default_values
    self.name ||= connection_type.name
  end
  

  def device_type
    [:input, :stop].select { |s| pin.device.id == stage.send("#{s}_device") }
  end

  def logic
    Ongoing.stage.send("#{device_type}_logic")
  end 

  def publish_code(file_name)
    begin
      file_path= Rails.root.join("lib/connections/#{file_name}.lua")
      code = replace_vars(IO.read(file_path))  
      Rails.application.config.mqtt_client.publish("/run/#{pin.device.chip_id}", code, retain=false)
    rescue  => e 
      logger.error(e.to_s)
    end
  end

  def replace_vars(s)
    default_values.merge(custom_values).each { |k, v| s.gsub!(k.to_s, v.to_s)}
    s
  end
  
  def custom_values 
    {}
  end
  def default_values
    {
      '$PIN' => pin.pin_number,
      '$IO_TYPE' => connection_type.io_type.upcase,
      '$NAME' => name.gsub(' ', '-'),
      '$ID' => id,
    }
  end
end
