require_relative 'player'

module TTT
  class PlayersFactory
    def generate_players(config)
      @config = config
      player_1 = TTT::HumanPlayer.new(value: config.player_1_value, name: config.player_1_name)
      if human_player_opponent?
        player_2 = TTT::HumanPlayer.new(value: config.player_2_value, name: config.player_2_name)
      else #computer player
        if expert?
        player_2 = TTT::ComputerPlayerExpert.new(value: config.player_2_value, name: config.player_2_name)
        else #novice
          player_2 = TTT::ComputerPlayerNovice.new(value: config.player_2_value, name: config.player_2_name)
        end
      end
      [player_1, player_2]
    end

    def human_player_opponent?
      @config.player_2_type == :human
    end

    def expert?
      @config.computer_knowledge_level == :expert
    end

    def computer_player_novice?
      @config.computer_knowledge_level == :novice
    end
  end
end