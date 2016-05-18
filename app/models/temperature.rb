class Temperature < ApplicationRecord
  after_create_commit do
    TemperatureBroadcastJob.perform_later(self)
    TempBasedCalJob.perform_later(self)
  end
end
