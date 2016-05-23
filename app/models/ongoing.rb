class Ongoing < ApplicationRecord
  after_commit do
    StagePlayBroadcastJob.perform_later
  end
  
  def self.stage
    return nil unless first
    return nil if first.stage == 0
    Stage.find(first.stage)
  end
end
