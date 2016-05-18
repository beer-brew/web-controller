class HeardBeatJob < ApplicationJob
  def perform
    TimerBroadcastJob.perform_later
    HeardBeatJob.set(wait: 5.seconds).perform_later
  end
end
