class TimerBroadcastJob < ApplicationJob
  queue_as :default

  def perform
    return unless o = Ongoing.first
    ActionCable.server.broadcast 'timer_channel', timeLeft: time_left(o)
  end

  private
  def time_left(o)
    return 'Not start' unless o.stage_start_time
    time_remain = o.stage_start_time + Stage.find(o.stage).duration * 60 - Time.now
    Time.at(time_remain).utc.strftime("%H:%M:%S")
  end
end
