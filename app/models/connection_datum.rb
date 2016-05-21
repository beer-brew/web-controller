class ConnectionDatum < ApplicationRecord
  belongs_to :connection

  after_create {
    OutputEvaluateJob.perform_later if connection.type.io_type == 'input'
  }
  def to_value
     connection.clazz.to_value(value) 
  end
  
end
