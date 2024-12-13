class Flag
  def initialize color=Gosu::Color.argb(255, 150, 125, 138)
    @@flag_arr = []
    i = 0
    z = -1
    28.times do

      if (i%2==0)
        z+=1
      end

      @@flag_arr.push({
        x: 570+(26*(i%2)),
        y: 50+(z*28.7),
        color: color
      })
      i+=1
    end
  end

  def draw
    @@flag_arr.each { |element| Gosu.draw_rect(element[:x], element[:y], 17, 17, element[:color])}
  end

  def self.array
    @@flag_arr
  end
end