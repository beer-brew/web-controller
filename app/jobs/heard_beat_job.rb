class HeardBeatJob < ApplicationJob
  def perform
    TimerBroadcastJob.perform_later
    HeardBeatJob.perform_later(wait: 5.seconds)
  end

end
