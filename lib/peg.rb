class Peg

  $guess_array ||= []
  $pegs ||= []

  @@array = 
  [
    "sprite/peg/01.png",
    "sprite/peg/02.png",
    "sprite/peg/03.png",
    "sprite/peg/04.png",
    "sprite/peg/05.png",
    "sprite/peg/06.png",
  ]

  def initialize peg_file, x, y
    @image = Gosu::Image.new(peg_file)
    @x = x
    @y = y
  end

  def draw
    @image.draw(@x, @y)
  end

  def self.bottom_pegs width, height
    width /= 3.1
    @@array.each do |peg|
      peg_obj = Peg.new(peg ,width, height-120)
      $pegs << peg_obj
      width += 50
    end
  end

  def self.erase
    unless Board.status[:pegs_placed]%4 == 0
      $pegs.pop
      $guess_array.pop
      Board.status[:pegs_placed] -= 1
    end
  end
end