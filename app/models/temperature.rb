class Temperature < ApplicationRecord
  after_create_commit do
    TemperatureBroadcastJob.perform_later(self)
    TempBasedCalJob.perform_later(self)
    TimerBroadcastJob.perform_later
  end
end
