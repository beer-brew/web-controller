class Stage < ApplicationRecord
  after_commit do
    StageBroadcastJob.perform_later(self)
  end

  def method_missing(name, *args, &block)
    return super unless [:input, :output, :stop].include? name
    Device.find(self.send("#{name}_device"))
  end

  def devices
    Device.find([input_device, output_device, stop_device].compact.unique)
  end

  def next
    class.order(:sequence).where('sequence > ?', sequence).first 
  end
end
