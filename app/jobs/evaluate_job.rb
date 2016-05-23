class EvaluateJob < ApplicationJob
  queue_as :default

  def perform(data)
    result = evaludate_input(data)
    if data.connection.device_type == :stop
     stop_or_next(result) 
    else 
      data.connection.exec(result)
    end
  end
  private
  def stop_or_next(result)
    return unless result
    Ongoing.stage.should_stop ? AlarmBroadcastJob.perform_later : Ongoing.update(stage: Ongoing.stage.next.sequence)
  end

  def evaludate_input(data)
   data.connection.eval(data.value) 
  end
end
