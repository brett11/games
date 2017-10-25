require 'set.rb'

module MM
  class GuessEvaluator
    # returns "XXXX" if perfect guess. returns XXO, for example, if two perfect guesses and one right digit but wrong place
    def self.evaluate_guess(secret_code, guess)
      #make arguments immutable
      secret_code.freeze
      guess.freeze
      resX = generate_Xs_for_exact_matches(secret_code, guess, [])
      secret_code_remaining = trim_exact_matches_from_secret_code(secret_code, guess, [])
      guess_remaining = trim_exact_matches_from_guess(secret_code, guess, [])
      resO = generate_Os_for_partial_matches(secret_code_remaining, guess_remaining)
      resX.concat resO
    end

    def self.generate_Xs_for_exact_matches(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?
      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        generate_Xs_for_exact_matches(tail_code, tail_guess, accum.push("X"))
      else
        generate_Xs_for_exact_matches(tail_code, tail_guess, accum)
      end
    end

    def self.trim_exact_matches_from_secret_code(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?
      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        trim_exact_matches_from_secret_code(tail_code, tail_guess, accum)
      else
        trim_exact_matches_from_secret_code(tail_code, tail_guess, accum.push(head_code))
      end
    end

    def self.trim_exact_matches_from_guess(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?
      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        trim_exact_matches_from_guess(tail_code, tail_guess, accum)
      else
        trim_exact_matches_from_guess(tail_code, tail_guess, accum.push(head_guess))
      end
    end

    def self.generate_Os_for_partial_matches(secret_code, guess)
      secret_code.sort!
      guess.sort!
      find_partial_matches_helper(secret_code, guess, [])
    end

    def self.find_partial_matches_helper(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?

      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        find_partial_matches_helper(tail_code, tail_guess, accum.push("O"))
      elsif head_code > head_guess
        find_partial_matches_helper(secret_code, tail_guess, accum)
      elsif head_code < head_guess
        find_partial_matches_helper(tail_code, guess, accum)
      end
    end
  end
end
