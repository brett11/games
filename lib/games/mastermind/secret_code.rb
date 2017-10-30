module MM
  class SecretCode

    def self.generate(io_helpers, is_code_guesser_human)
      if is_code_guesser_human
        set_secret_code
      else
        io_helpers.get_secret_code_from_user
      end
    end

    def self.set_secret_code
      secret_code = []
      4.times do
        secret_code.push((1..6).to_a.sample)
      end
      secret_code
    end
  end
end
