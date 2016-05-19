class Device < ApplicationRecord
  enum status: [:offline, :online]
  has_many :pins
end
