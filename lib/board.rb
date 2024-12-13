class Board
  def initialize width, height
    @@ELEMENTS = {
      WINDOW_BACKGROUND: {
        x: 0,
        y: 0,
        width: width,
        height: height,
        color: Gosu::Color.argb(255, 85, 223, 134)
      },
      BOARD_BACKGROUND: {
        x: width/3, 
        y: 40, 
        width: width/2.7, 
        height: height-80, 
        color: Gosu::Color.argb(190, 0, 0, 0)
      },
      BOARD_ROWS: {
        x: width/3+9, 
        y: 50, 
        width: width/2.88, 
        height: height/12, 
        color: Gosu::Color.argb(255, 73, 48, 61)
      },
      FEEDBACK_COLUMN: {
        x: width/3+width/2.7, 
        y: 40, 
        width: width/12, 
        height: height-80, 
        color: Gosu::Color.argb(190, 0, 0, 0)
      }
    }

    @@board_state = {
      pegs_placed: 0,
      guesses: 0,
    }
  end

  def draw

    @@ELEMENTS.map do |element_name, element_hash|
      element = DrawableBoard.new(element_name, element_hash)
      element.draw
    end

  end

  def self.elements
    @@ELEMENTS
  end

  def self.status
    @@board_state
  end

end