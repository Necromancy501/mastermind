#GOTO RULESET

require 'gosu'
require_relative 'lib/peg'
require_relative 'lib/board'
require_relative 'lib/flag'
require_relative 'lib/ruleset'
require_relative 'lib/selector'
require_relative 'lib/keymap'
require_relative 'lib/dboard'
require_relative 'lib/dpeg'

class Mastermind < Gosu::Window
  WIDTH = 800
  HEIGHT = 600
  TITLE = "Mastermind"

  def initialize
    super WIDTH, HEIGHT
    self.caption = TITLE
    Ruleset.choice
    @objects = {window: self}
    @objects[:board] = Board.new(WIDTH, HEIGHT)
    @objects[:selector] = Selector.new(WIDTH, HEIGHT)
    Peg.bottom_pegs(WIDTH, HEIGHT)
    @objects[:flag] = Flag.new
  end

  def draw
    @objects[:board].draw
    $pegs.each(&:draw)
    @objects[:selector].draw
    @objects[:flag].draw
  end

  def update
    Ruleset.guess_submit
  end

  def button_down(id)
    Keymap.key_mappings(id, @objects)
  end
  
end

Mastermind.new.show