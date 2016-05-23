class Timer < Connection 
  def setup
  end
  def run
   TimerJob.set(wait: to_value(logic).minutes).perform_later
  end

  def eval(data) 
    true
  end

  def to_value(value)
   value.to_i 
  end
end

