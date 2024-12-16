class Selector
  def initialize(width, height)
    @image = Gosu::Image.new("sprite/selector/01.png")
    @x = width / 2.86
    @y = height - 140
    @i = 1
  end

  def draw
    @image.draw(@x, @y, 0, 0.03, 0.03)
  end

  def move_right
    unless @i==6
      @x += 50
      @i += 1
    else
      @x -= 250
      @i -= 5
    end
  end

  def move_left
    unless @i==1
      @x -= 50
      @i -= 1
    else
      @x += 250
      @i += 5
    end
  end

  def current
    @i
  end

  def select_peg
    current_peg = "sprite/peg/0#{@i}.png"
    peg_obj = DrawablePeg.new current_peg
    peg_obj.draw
    $guess_array.push(@i)
  end
end