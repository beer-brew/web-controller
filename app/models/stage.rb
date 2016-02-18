class Stage < ApplicationRecord
  after_commit do
    StagePlayBroadcaseJob.perform_later(self)
  end
end
