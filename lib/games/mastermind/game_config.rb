module MM
  class GameConfig
    attr_accessor :io_helpers

    attr_accessor :player_1_name
    attr_accessor :code_guesser
    attr_accessor :computer_knowledge_level
    attr_accessor :secret_code
    attr_accessor :number_of_rows
    attr_accessor :number_of_cols

    def initialize(io_helpers)
      @io_helpers = io_helpers
      @number_of_rows = 12
      @number_of_cols = 4

    end

    def one_time_setup
      #defaults set above. uncomment to ask the player to choose
      # self.number_of_rows = io_helpers.get_number_of_rows
      # self.number_of_cols = io_helpers.get_number_of_cols
    end

    def every_time_setup
      self.code_guesser = io_helpers.computer_or_human_guesser_inquiry
      if code_guesser == :human
        self.player_1_name = io_helpers.get_player_1_name
      else
        self.player_1_name = "Computer"
        self.computer_knowledge_level = io_helpers.get_computer_knowledge_level
      end
      self.secret_code = get_secret_code
    end

    def get_secret_code
      code = nil
      if code_guesser == :computer
        code = io_helpers.get_secret_code_from_user(player_1_name)
      elsif code_guesser == :human
        code = set_secret_code
      end
      code
    end

    def set_secret_code
      secret_code = []
      4.times do
        secret_code.push((1..6).to_a.sample)
      end
      secret_code
    end
  end
end