module StatusHelper
  def color(t)
    red = [0,[(t/0.390625).to_i,255].min].max
    blue = [0,[(255-red).to_i,255].min].max
    "\##{"%02x" % red}00#{"%02x" % blue}"
  end

  def temp_height(t)
    "#{[25,[0, (0.25*t).to_i].max].min}px"
  end
end
