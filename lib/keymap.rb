class Keymap
  def self.key_mappings(id, objects_hash)

    if id == Gosu::KB_ESCAPE
      objects_hash[:window].close
    end

    unless $choice == 0 || $win == true
      case id
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
end