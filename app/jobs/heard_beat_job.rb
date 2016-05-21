class HeardBeatJob < ApplicationJob
  def perform
    HeardBeatJob.set(wait: 5.seconds).perform_later
  end
end
