class Pin < ApplicationRecord
  belongs_to :device
  has_one :connection
end
