class DrawablePeg

  @@x_scalar = 0
  @@y_scalar = 0

  def initialize peg_file
    @initial_x = Board.elements[:BOARD_ROWS][:x]+3
    @initial_y = Board.elements[:BOARD_ROWS][:y]-8
    @pegs_total = Board.status[:pegs_placed]
    @row_index = Board.status[:guesses]
    @peg_file = peg_file
  end

  def draw

    @@x_scalar = @pegs_total%4
    @@y_scalar = @row_index

    unless @pegs_total == 28

      peg_obj = Peg.new(@peg_file, @initial_x+(70*@@x_scalar), @initial_y+(57*@@y_scalar))
      $pegs << peg_obj
      Board.status[:pegs_placed] += 1

      if @@x_scalar == 3
        Board.status[:guesses] += 1
      end
      
    end

  end

end