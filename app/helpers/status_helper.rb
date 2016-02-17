module StatusHelper
  def color(t)
    red = [0,[(t/0.390625).to_i,256].min].max
    blue = [0,[(256-red).to_i,256].min].max
    "\##{red.to_s(16)}00#{blue.to_s(16)}"
  end

  def temp_height(t)
    "#{[25,[0, (0.25*t).to_i].max].min}px"
  end
end
