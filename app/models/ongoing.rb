class Ongoing < ApplicationRecord
  after_commit do
    StagePlayBroadcastJob.perform_later(self)
  end
end
