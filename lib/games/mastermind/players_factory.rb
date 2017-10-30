require_relative '../shared/players_factory'
require_relative '../mastermind/human_player'
require_relative '../mastermind/computer_player_novice'

module MM
  class PlayersFactory < Shared::PlayerFactory
    #returns an array in case we would like to extend the game to allow for multiple players
    def generate_players
      player_1_factory = find_appropriate_player_1_factory
      player_1 = player_1_factory.generate_player
      [player_1]
    end

    def find_appropriate_player_1_factory
      code_guesser = io_helpers.computer_or_human_guesser_inquiry
      if code_guesser == :human
        is_player_1_saved = io_helpers.is_player_1_saved?
        if is_player_1_saved
          MM::PlayerFactoryHumanSaved.new(io_helpers)
        else
          MM::PlayerFactoryHumanNew.new(io_helpers)
        end
      else
        computer_knowledge_level = io_helpers.get_computer_knowledge_level
        if computer_knowledge_level == :novice
          MM::PlayerFactoryComputerNovice.new(io_helpers)
        else
          MM::PlayerFactoryComputerExpert.new(io_helpers)
        end
      end
    end
  end
end