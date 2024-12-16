class Mastermind
  def initialize
    # Generate all possible codes (1 to 6 for each digit)
    @all_codes = generate_codes
    @possible_codes = @all_codes.dup
    @guesses = []
    @initial_guess = [1, 1, 2, 2]
    @current_guess = @initial_guess
  end

  # Generate all possible codes: 4 digits with each digit between 1 and 6
  def generate_codes
    (1111..6666).to_a.select { |code| code.to_s.chars.all? { |d| d.to_i.between?(1, 6) } }
  end

  # Get the feedback (black and white pegs)
  def get_feedback(guess, secret)
    # Assume secret is an array of integers (e.g., [1, 2, 3, 4])
    guess = guess.map(&:to_i)
    black_pegs = 0
    white_pegs = 0
    secret_copy = secret.dup
    guess_copy = guess.dup

    # First pass: check for exact matches (black pegs)
    guess_copy.each_with_index do |g, i|
      if g == secret_copy[i]
        black_pegs += 1
        secret_copy[i] = nil
        guess_copy[i] = nil
      end
    end

    # Second pass: check for color matches (white pegs)
    guess_copy.each_with_index do |g, i|
      next if g.nil?
      index = secret_copy.index(g)
      if index
        white_pegs += 1
        secret_copy[index] = nil
      end
    end

    [black_pegs, white_pegs]
  end

  # Filter out codes from @possible_codes that would not produce the same feedback
  def filter_codes(feedback)
    @possible_codes.reject! do |code|
      get_feedback(@current_guess, code) != feedback
    end
  end

  # Minimax strategy: find the guess that minimizes the worst-case size of remaining possibilities
  def minimax_guess
    best_score = Float::INFINITY
    best_guess = nil

    # Try each possible guess in @possible_codes and calculate its score
    @possible_codes.each do |guess|
      # Create a hash to count the response frequencies
      response_counts = Hash.new(0)

      # Group all possible codes by their response to this guess
      @possible_codes.each do |code|
        feedback = get_feedback(guess, code)
        response_counts[feedback] += 1
      end

      # Find the worst-case scenario for this guess
      worst_case = response_counts.values.max

      # If this guess has a better (lower) worst-case score, pick it
      if worst_case < best_score
        best_score = worst_case
        best_guess = guess
      elsif worst_case == best_score
        # If scores are tied, pick the numerically smallest guess
        best_guess = [best_guess, guess].min
      end
    end

    best_guess
  end

  # Play the game: start with the initial guess and iterate
  def play_game(secret)
    feedback = [0, 0] # No feedback yet
    while feedback != [4, 0]
      # Make a guess
      puts "Guess: #{@current_guess.join}"
      
      # Get the feedback from the secret
      feedback = get_feedback(@current_guess, secret)
      puts "Feedback: #{feedback.join(' peg(s)')}"
      
      # If we win (4 black pegs), exit the loop
      break if feedback == [4, 0]

      # Filter out codes that are not consistent with the feedback
      filter_codes(feedback)
      
      # Choose the next guess using minimax strategy
      @current_guess = minimax_guess
    end
    puts "You won the game in #{@guesses.size} guesses!"
  end
end

# To play the game:
secret_code = [1, 4, 2, 3]  # Example secret code
game = Mastermind.new
game.play_game(secret_code)

