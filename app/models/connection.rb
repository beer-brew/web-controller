class Connection < ApplicationRecord
  belongs_to :pin

  before_save :set_default_values
  
  def set_default_values
    self.name ||= type.name 
  end

  def type
    ConnectionType.find(connection_type_id)
  end

  def class_name
    type.class_name
  end

  def config_driver
    setup_code = replace_vars(IO.read("lib/connection/#{setup_file}_setup.lua"))
    Rails.application.config.mqtt_client.publish("/setup/#{pin.device.chip_id}", setup_code, retain=true)
  end
  def replace_vars(s)
    default_values.merge(custom_values).each { |k, v| s.gsub!(k.to_s, v.to_s)}
    s
  end
  
  def default_values
    {
      '$PIN' => pin_id,
      '$IO_TYPE' => type.io_type.upcase,
      '$NAME' => name,
      '$ID' => id
    }
  end
end
