require 'logging'

module TTT
  class Minimax
    attr_accessor :board, :number_of_turns_taken, :human_value, :computer_value, :choice

    def initialize(board, number_of_turns_taken, human_value, computer_value)
      @board = board
      @number_of_turns_taken = number_of_turns_taken
      @human_value = human_value
      @computer_value = computer_value
    end

    def run_minimax
      scores = []
      choices = []

      board_won = board.won?
      board_full = board.full?

      if board_won || board_full
        #rewind one player to see which player took last turn and therefore won the game
        self.number_of_turns_taken -= 1
        # note: need return statement here so that method stops here if board is won or full
        return score(board_won)
      end

      # @logger.debug "avaliable choices collection: #{available_choices}"

      available_choices.each do |available_choice|
        board_copy = Marshal.load(Marshal.dump(board))
        board_copy.change_square(available_choice, player_value)
        choices.push(available_choice)
        minimax = TTT::Minimax.new(board_copy, number_of_turns_taken + 1, human_value, computer_value)
        scores.push minimax.run_minimax
      end

      if computer_current_player?
        #https://stackoverflow.com/questions/2149802/in-ruby-what-is-the-cleanest-way-of-obtaining-the-index-of-the-largest-value-in
        max_score_index = scores.each_with_index.max[1]
        self.choice = choices[max_score_index]
        scores[max_score_index]
      else
        # This is the min calculation
        min_score_index = scores.each_with_index.min[1]
        self.choice = choices[min_score_index]
        scores[min_score_index]
      end
    end


    private
    def available_choices
      board.available_choices
    end

    def player_value
      if computer_current_player?
        computer_value
      else
        human_value
      end
    end

    def computer_current_player?
      #computer goes second, when number of turns taken is always odd
      number_of_turns_taken.odd?
    end

    def score(board_won)
      if board_won && computer_current_player?
        return +1
      elsif board_won && !computer_current_player?
        return -1
      else
        return 0
      end
    end
  end
end


