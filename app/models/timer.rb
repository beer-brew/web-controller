class Timer < Connection 
  has_one :pin, as: :connection
  has_many :connection_data 
  default_scope { where.class_name == 'Timer' } 

  def setup_file 
    'ds18b20'
  end
  def run_file
    'ds18b20'
  end

  def custom_values
    {} 
  end

  def setup
    
  end
  def run
    run_code 
  end
  def self.to_value(value)
   value.round(1) 
  end
end

