class OutputEvaluateJob < ApplicationJob
  queue_as :default

  def perform
    stage = Ongoing.stage 
    result = output(stage.input, stage.output_logic) 
    exec_output(stage.output, result) 
  end
  private
  def exec_output(output, result)
    output.clazz.exec(result)
  end
  def output(input, output_logic)
    evaluate("#{input.last_value} #{output_logic}") 
  end
  def evaluate(str)
    eval(str)
  end
end
