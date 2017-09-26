module MM
  class GameConfig
    attr_accessor :input_helper

    attr_accessor :player_1_name
    attr_accessor :code_setter
    attr_accessor :secret_code
    attr_accessor :number_of_rows
    attr_accessor :number_of_cols

    def initialize(input_helper)
      @input_helper = input_helper
    end

    def setup
      self.player_1_name = input_helper.get_player_1_name
      self.number_of_rows = input_helper.get_number_of_rows
      self.number_of_cols = input_helper.get_number_of_cols
      self.code_setter = input_helper.computer_or_human_code_setter_inquiry(player_1_name)
      self.secret_code = get_secret_code
    end

    def get_secret_code
      code = nil
      if code_setter == :human
        code = input_helper.get_secret_code_from_user(player_1_name)
      elsif code_setter == :computer
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