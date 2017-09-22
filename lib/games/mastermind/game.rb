module MM
  class Game < Games::Shared::Game
    attr_accessor :code_setter, :secret_code, :current_guess

    def local_setup
      self.code_setter = config.code_setter
      self.secret_code = secret_code
    end

    def over?
      won? || over_with_no_winner?
    end

    def over_with_no_winner?
      !won? && number_of_turns_taken >= 12
    end

    def won?
      current_guess == secret_code
    end

  end
end
