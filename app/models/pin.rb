class Pin < ApplicationRecord
  belongs_to :device
  has_one :connection
  enum pin_type: [:input, :output]
end
