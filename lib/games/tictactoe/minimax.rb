module TTT
  class Minimax

    attr_accessor :game, :choice

    def initialize(game)
      @game = game
    end

    def run_minimax
      scores = []
      choices = []
      if game.over?
        return score(game)
      end

      available_choices.each do |available_choice|
        game_copy = Marshal.load(Marshal.dump(game))
        game_copy.change_game_state(available_choice, game_copy)
        #below needed because pry indicates possible_game_state's board not updating after make_move above
        # possible_game_state.game_board = possible_board_state
        choices.push(available_choice)
        minimax = Minimax.new(game_copy)
        scores.push minimax.run_minimax
      end

      if game.current_player == computer_player

        #https://stackoverflow.com/questions/2149802/in-ruby-what-is-the-cleanest-way-of-obtaining-the-index-of-the-largest-value-in
        max_score_index = scores.each_with_index.max[1]
        @choice = choices[max_score_index]
        return scores[max_score_index]
      else
        # This is the min calculation
        min_score_index = scores.each_with_index.min[1]
        @choice = choices[min_score_index]
        return scores[min_score_index]
      end

    end

    private
    def available_choices
      game.available_choices
    end

    def score(game)
      if game.won? && game.winner == computer_player
        return +1
      elsif game.won? && game.winner == player_1
        return -1
      else
        return 0
      end
    end

    def player_1
      game.players[0]
    end

    def computer_player
      game.players[1]
    end
  end
end