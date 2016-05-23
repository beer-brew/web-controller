class Device < ApplicationRecord
  enum status: [:offline, :online]
  has_many :pins
  has_many :connections, through: :pins
  scope :wired_with_type, -> (type) do 
    wired_devices.select { |d| d.type == type }
  end

  scope :with_type, -> (devices, type) do
    devices.select { |d| d.type == type } 
  end
  scope :unwired_devices, -> do
    all - wired_devices
  end
  scope :wired_devices, -> do
    all.select { |d| d.connections.any? }
  end

  def conn_name
    connections.first.name
  end

  def type
    pins.first.pin_type
  end
end
