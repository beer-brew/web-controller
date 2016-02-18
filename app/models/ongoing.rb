class Ongoing < ApplicationRecord
  after_commit do
    p 'commiting....'
    StagePlayBroadcastJob.perform_later(self)
  end
end
