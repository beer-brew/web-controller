class OutputEvaludateJob < ApplicationJob
  queue_as :default

  def perform
    stage = Ongoing.stage 
    result = output(stage.input, stage.output_logic) 
    logger.debug(stage.input.to_s.concat(logic))
    logger.debug(result)
    exec_output(stage.output, result) 
    OutputBroadcastJob.set(wait: 5.seconds).perform_later 
  end
  private
  def exec_output(output, result)
    output.clazz.exec(result)
  end
  def output(input, output_logic)
    evaluate("#{input.last_value} #{output_logic}") 
  end
  def evaludate(str)
    eval(str)
  end
end
