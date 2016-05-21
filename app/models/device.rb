class Device < ApplicationRecord
  enum status: [:offline, :online]
  has_many :pins
  scope :wired_with_type, -> (type) do 
    wired_devices.select { |d| d.type == type }
  end

  scope :unwired_devices, -> do
    all - wired_devices
  end
  scope :wired_devices, -> do
    all.select { |d| d.conn }
  end

  def first_pin
    pins.first
  end 

  def conn
    first_pin.try(:connection)
  end

  def last_value 
    clazz.connection_data.last.to_value
  end

  def clazz
    conn.clazz
  end 

  def type
    conn.type.io_type
  end
  def conn_name
    conn.type.name
  end
end
