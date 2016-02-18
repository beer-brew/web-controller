class TempBasedCalJob < ApplicationJob
  queue_as :default

  def perform(t)
    return unless o = Ongoing.first
    stage_control(o,t)
    heator_control(o,t)
  end

  private
  def stage_control(o, t)
    o.stage_start_time = Time.now if start_stage?(o, t)
    if next_stage?(o)
      o.stage = find_next_stage(o).id
      o.save
    end
  end

  def heator_control(o,t)
    if reach_target_temp?(o.stage, t.temperature) && Heater.last.status == true
      Heater.create status: false
    elsif !reach_target_temp?(o.stage, t.temperature) && Heater.last.status == false
      Heater.create status: true
    end
  end

  def start_stage?(o, t)
    !o.stage_start_time && reach_target_temp?(o.stage, t.temperature)
  end

  def reach_target_temp?(current_stage, temperature)
    temperature > stage(current_stage).target_temperature
  end

  def next_stage?(o)
    (o.stage_start_time + stage(o.stage).duration * 60) > Time.now
  end

  def find_next_stage(o)
    Stage.where("sequence > ?", stage(o.stage).sequence).order(:sequence).first
  end

  def stage(current_stage)
    Stage.find(current_stage)
  end
end
