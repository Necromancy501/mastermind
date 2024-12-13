class Keymap
  def self.key_mappings(id, objects_hash)
    case id
    when Gosu::KB_ESCAPE
      objects_hash[:window].close
    when Gosu::KB_RIGHT
      objects_hash[:selector].move_right
    when Gosu::KB_LEFT
      objects_hash[:selector].move_left
    when Gosu::KB_RETURN
      objects_hash[:selector].select_peg
    when Gosu::KB_BACKSPACE
      Peg.erase
    end
  end
end