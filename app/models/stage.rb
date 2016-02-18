class Stage < ApplicationRecord
  after_commit do
    StageBroadcastJob.perform_later(self)
  end
end
