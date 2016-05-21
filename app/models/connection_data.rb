class ConnectionData < ApplicationRecord
  belongs_to :connection
 
  def to_value
     connection.clazz.to_value(value) 
  end
  
end
