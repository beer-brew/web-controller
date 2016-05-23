class Connection < ApplicationRecord
  has_many :connection_data 
  belongs_to :connection_type 
  belongs_to :pin
  before_save :set_default_values
  
  def set_default_values
    self.name ||= type.name 
  end
  

  def device_type
    [:input, :stop].select { |s| pin.device.id == stage.send("#{s}_device") }
  end

  def logic
    Ongoing.stage.send("#{device_type}_logic")
  end 

  def config_driver
    begin 
      setup_code = replace_vars(IO.read("lib/connection/#{setup_file}_setup.lua"))
      Rails.application.config.mqtt_client.publish("/setup/#{pin.device.chip_id}", setup_code, retain=true)
    rescue
      logger.error('read file errors')
    end
  end
  def run_code 
    begin
      run_code = replace_vars(IO.read("lib/connection/#{run_file}_run.lua"))  
      Rails.application.config.mqtt_client.publish("/run/#{pin.device.chip_id}", run_code, retain=true)
    rescue
      logger.error('read file error')
    end
  end

  def output
    begin
      run_code = replace_vars(IO.read("lib/connection/#{run_file}_run.lua"))  
      Rails.application.config.mqtt_client.publish("/run/#{pin.device.chip_id}", run_code, retain=true)
    rescue
      logger.error('read file error')
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
      '$PIN' => pin_id,
      '$IO_TYPE' => type.io_type.upcase,
      '$NAME' => name.gsub(' ', '-'),
      '$ID' => id,
    }
  end
end
