require File.join('games', 'shared', 'players_factory')
require File.join('games', 'tictactoe', 'human_player')
require File.join('games', 'tictactoe', 'computer_player_expert')
require File.join('games', 'tictactoe', 'computer_player_novice')

module TTT
  class PlayersFactory < Shared::PlayersFactory
    def generate_players
      player_1 = generate_player_1_new
      player_2 = generate_player_2(player_1.value)
      [player_1, player_2]
    end

    def generate_player_2(player_value_taken)
      player_2_type = io_helpers.get_player_2_type
      if player_2_type == :human
        generate_player_2_human(player_value_taken)
      else #second_player_computer
        computer_knowledge_level = io_helpers.get_computer_knowledge_level
        if computer_knowledge_level == :novice
          generate_player_2_computer_novice(player_value_taken)
        else
          generate_player_2_computer_expert(player_value_taken)
        end
      end
    end

    def generate_player_1_new
      player_name = io_helpers.get_player_1_name
      player_value = io_helpers.get_player_value(player_name, "")
      TTT::HumanPlayer.new(name: player_name, value: player_value)
    end

    def generate_player_2_human(player_value_taken)
      player_name = io_helpers.get_player_2_name
      player_value = io_helpers.get_player_value(player_name, player_value_taken )
      TTT::HumanPlayer.new(name: player_name, value: player_value)
    end

    def generate_player_2_computer_novice(player_value_taken)
      TTT::ComputerPlayerNovice.new(name: "Computer", value: computer_value(player_value_taken))
    end

    def generate_player_2_computer_expert(player_value_taken)
      TTT::ComputerPlayerExpert.new(name: "Computer", value: computer_value(player_value_taken))
    end

    def computer_value(taken)
      if taken != "O"
        "O"
      else
        "X"
      end
    end
  end
end