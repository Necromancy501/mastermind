

class Ruleset

  $win = false

  @@choice_arr = []
  @@z = 0
  @@i = 0
  @@x = 0
  @@y = 0

  def self.choice
    if $choice == 1
      4.times do 
        @@choice_arr.push(rand(1..6))
      end
      p @@choice_arr
    else
      4.times do
        p 'Choose number: ' 
        @@choice_arr.push(gets.chomp.to_i)
      end
      p @@choice_arr
      $bot.play_game @@choice_arr
    end
  end

  def self.guess_submit
    if Board.status[:pegs_placed]%4 == 0
      Ruleset.guess_check
      @@i=0
      @@y=0
      $guess_array = []
    end
  end

  def self.win
    p "You win! :)"
    $win = true
  end

  def self.guess_check
    $bot.play_guess if $choice == 0
    flag_counter = @@z
    exact_matches = []
    secret_matches = []
    win_counter = 0
    quit_counter = 1
    choice_copy = @@choice_arr.map(&:clone)

    while @@z < Board.status[:pegs_placed]
        if $guess_array[@@i] == @@choice_arr[@@i]
          Flag.array[flag_counter][:color] = Gosu::Color.argb(255, 67, 255, 231)
          flag_counter +=1
          win_counter += 1
          choice_copy[@@i] = 0
          exact_matches.push(@@i)
        end
        @@i+=1
        @@z+=1
    end

    while @@x < Board.status[:pegs_placed]
      if win_counter ==  4 && quit_counter == 1
        Ruleset.win
        quit_counter = 0
      end
      unless exact_matches.include?(@@y) || secret_matches.include?(@@y)
        if choice_copy.include?($guess_array[@@y])
          Flag.array[flag_counter][:color] = Gosu::Color.argb(255, 255, 221, 165)
          flag_counter += 1
          first_ocurrence = choice_copy.find_index($guess_array[@@y])
          choice_copy[first_ocurrence] = 0
          secret_matches.push(@@y)
        end
      end
      @@y+=1
      @@x+=1

      if @@y == 4
        $feedback = [exact_matches.length, secret_matches.length]
      end
    end
    
  end
end