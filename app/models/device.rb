class Device < ApplicationRecord
  enum status: [:offline, :online]
  has_many :pins
  has_many :connections, through: :pins

  scope :with_type, -> (type) do
    select { |d| d.type == type } 
  end

  scope :actual, -> do
    where('chip_id > 1000')
  end

  scope :wired, -> do
    select { |d| d.connections.any? }
  end

  def conn_name
    connections.first.name + ' ' + id.to_s
  end

  def type
    pins.first.pin_type
  end
end
