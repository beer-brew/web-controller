class ConnectionType < ApplicationRecord
  enum catagory: [:analog, :gpio,:i2c, :uart]  
  enum io_type: [:input, :output]
  has_many :connections
end
