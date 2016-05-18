class Device < ApplicationRecord
  has_many :pins
  enum status: [ offline: 0, online: 1 ]
end
