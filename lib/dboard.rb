class DrawableBoard
  def initialize(element_name, element_hash)
    @name = element_name
    @x = element_hash[:x]
    @y = element_hash[:y]
    @width = element_hash[:width]
    @height = element_hash[:height]
    @color = element_hash[:color]
  end

  def draw
    unless @name == :BOARD_ROWS
      Gosu.draw_rect(@x, @y, @width, @height, @color)
    else
      i = 0
      7.times do
        Gosu.draw_rect(@x, @y+i, @width, @height, @color)
        i+=57
      end
    end
  end
end