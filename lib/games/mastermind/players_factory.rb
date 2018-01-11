require File.join('games', 'shared', 'players_factory')
require File.join('games', 'mastermind', 'human_player')
require File.join('games', 'mastermind', 'computer_player_expert')
require File.join('games', 'mastermind', 'computer_player_novice')

module MM
  class PlayersFactory < Shared::PlayersFactory
    def generate_players
      player_1 = generate_player_1
      [player_1]
    end

    def generate_player_1
      code_guesser = io_helpers.computer_or_human_guesser_inquiry
      if code_guesser == :human
        generate_player_1_new
      else
        computer_knowledge_level = io_helpers.get_computer_knowledge_level
        if computer_knowledge_level == :novice
          generate_player_1_computer_novice
        else
          generate_player_1_computer_expert
        end
      end
    end

    def generate_player_1_new
      player_name = io_helpers.get_player_1_name
      MM::HumanPlayer.new(name: player_name)
    end

    def generate_player_1_computer_novice
      MM::ComputerPlayerNovice.new(name: "Computer")
    end

    def generate_player_1_computer_expert
      MM::ComputerPlayerExpert.new(name: "Computer")
    end
  end
end