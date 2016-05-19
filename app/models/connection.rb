class Connection < ApplicationRecord
  belongs_to :pin, optional: true

  enum catagory: [:analog, :gpio,:i2c, :uart]  
  enum io_type: [:input, :output]
end
