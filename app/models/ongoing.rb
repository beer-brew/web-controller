class Ongoing < ApplicationRecord
  after_commit do
    StagePlayBroadcastJob.perform_later
  end
  
  scope :stage, -> { Stage.find(first.stage)}
end
