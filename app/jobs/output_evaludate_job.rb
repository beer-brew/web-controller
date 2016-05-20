class OutputEvaludateJob< ApplicationJob
  queue_as :default

  def perform(input, logic, connection_id, device)
    logger.debug(input.to_s.concat(logic))
    InputData.create(input_data: input.to_f, connection_id: connection_id)
    result = eval(input.to_s.concat(logic))
    OutputBroadcastJob.perform_later(device, result) 
  end
end
