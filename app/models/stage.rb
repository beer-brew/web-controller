class Stage < ApplicationRecord
  after_commit do
    StageBroadcastJob.perform_later(self)
  end

  def method_missing(name, *args, &block)
    return super unless [:input, :output, :stop].include? name
    Device.find(self.send("#{name}_device"))
  end
end
