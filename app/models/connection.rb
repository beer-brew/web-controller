class Connection < ApplicationRecord
  enum catagory: [:analog, :gpio,:i2c, :uart]  
  enum io_type: [:input, :output]
end
