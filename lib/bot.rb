class Bot

  $feedback = [0, 0]

  def initialize
    # Generate all possible codes (1 to 6 for each digit)
    @all_codes = generate_codes
    @possible_codes = @all_codes.dup
    @guesses = []
    @initial_guess = [1, 1, 2, 2]
    @current_guess = @initial_guess
  end

  def generate_codes
    (1111..6666).to_a.select { |code| code.to_s.chars.all? { |d| d.to_i.between?(1, 6) } }
  end

end