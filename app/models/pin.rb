class Pin < ApplicationRecord
  belongs_to :device
  enum pin_type: [:input, :output]
end
