require_relative 'player_factory_computer_expert'
require_relative 'player_factory_computer_novice'
require_relative 'player_factory_human_new'
require_relative 'player_factory_human_saved'

module TTT
  class PlayersFactory
    attr_accessor :io_helpers

    def initialize(io_helpers)
      @io_helpers = io_helpers
    end

    def generate_players
      player_1_factory = find_appropriate_player_1_factory
      player_1 = player_1_factory.generate_player(true)
      player_2_factory = find_appropriate_player_2_factory
      player_2 = player_2_factory.generate_player(false, player_1.value)
      [player_1, player_2]
    end

    def find_appropriate_player_1_factory
      is_player_1_saved = io_helpers.is_player_1_saved?
      if is_player_1_saved
        TTT::PlayerFactoryHumanSaved.new(io_helpers)
      else
        TTT::PlayerFactoryHumanNew.new(io_helpers)
      end
    end

    def find_appropriate_player_2_factory
      player_2_type = io_helpers.get_player_2_type
      if player_2_human?(player_2_type)
        is_player_2_saved = io_helpers.is_player_2_saved?
        if is_player_2_saved
          TTT::PlayerFactoryHumanSaved.new(io_helpers)
        else
          TTT::PlayerFactoryHumanNew.new(io_helpers)
        end
      else #player_2_computer?
        computer_knowledge_level = io_helpers.get_computer_knowledge_level
        if computer_player_novice?(computer_knowledge_level)
          TTT::PlayerFactoryComputerNovice.new(io_helpers)
        else
          TTT::PlayerFactoryComputerExpert.new(io_helpers)
        end
      end
    end


    def player_2_human?(type)
      type == :human
    end


    def computer_player_novice?(computer_knowledge_level)
      computer_knowledge_level == :novice
    end
  end
end