class StagesController < ApplicationController
  def index
    @stages = Stage.all
    @current_stage = Ongoing.first.try(:stage)
    if Device.any?
      components = Device.all.group_by do |d|
        d.pins.first.connection_id==nil
      end[false]
    end
    if components
      grouped_components = components.group_by do |c|
        Connection.find(c.pins.first.connection_id).io_type == 'input'
      end
      @input_devices = grouped_components[true] 
      @output_devices = grouped_components[false] 
    end
  end
end
