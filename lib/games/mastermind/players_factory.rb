require_relative '../mastermind/human_player'
require_relative '../mastermind/computer_player_novice'

module MM
  class PlayersFactory
    #returns an array in case we would like to extend the game to allow for multiple players
    def generate_players(config)
      if config.code_guesser == :human
        player_1 = MM::HumanPlayer.new(name: config.player_1_name)
      else #player_1 is computer
        if config.computer_knowledge_level == :novice
          player_1 = MM::ComputerPlayerNovice.new(name: config.player_1_name)
        elsif config.computer_knowledge_level == :expert
          player_1 = MM::ComputerPlayerExpert.new(name: config.player_1_name)
        end
      end
      [player_1]
    end
  end
end