class Device < ApplicationRecord
  enum status: [:offline, :online]
  has_many :pins
  scope :connected_device, -> (type) do 
    all.select { |d| d.type == type }
  end

  def type
    return nil unless conn_id = pins.first.connection_id
    Connection.find(pins.first.connection_id).io_type
  end
  def conn_name
    return nil unless conn_id = pins.first.connection_id
    Connection.find(pins.first.connection_id).name
  end
end
