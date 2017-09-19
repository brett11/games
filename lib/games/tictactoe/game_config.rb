module TTT
  class GameConfig
    attr_accessor :input_helper

    attr_accessor :player_1_name
    attr_accessor :player_1_value
    attr_accessor :player_2_type
    attr_accessor :player_2_name
    attr_accessor :player_2_value
    attr_accessor :computer_difficulty_level
    attr_accessor :number_of_rows_cols

    def initialize(input_helper)
      @input_helper = input_helper
      setup

    end

    def setup
      set_player_1_values
      set_player_2_values
      set_board_rows_cols
    end

    def set_player_1_values
      self.player_1_name = input_helper.get_player_1_name
      self.player_1_value = input_helper.get_player_1_value(player_1_name)
    end

    def set_player_2_values
      self.player_2_type = input_helper.get_player_2_type
      if player_2_human?
        self.player_2_name = input_helper.get_player_2_name
        self.player_2_value = input_helper.get_player_2_value(player_1_value)
      elsif player_2_computer?
        self.player_2_name = "Computer"
        self.player_2_value = get_computer_value
        self.computer_difficulty_level = input_helper.get_computer_difficulty_level
      end
    end

    def set_board_rows_cols
      #need this if else logic because if computer is difficult, it runs minimax, which is too slow to allow for more than 3 rows/cols
      if computer_difficult?
        self.number_of_rows_cols = input_helper.get_number_of_rows_cols_max_3
      else
        self.number_of_rows_cols = input_helper.get_number_of_rows_cols_max_9
      end
    end

    def player_2_human?
      player_2_type == :human
    end

    def player_2_computer?
      player_2_type == :computer
    end

    def computer_difficult?
      computer_difficulty_level == :difficult
    end

    def get_computer_value
      if player_2_value != "O"
        "O"
      else
        "X"
      end
    end
  end
end