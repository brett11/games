require File.join('games', 'mastermind', 'guess_evaluator_result')

module MM
  class GuessEvaluator
    # below returns a Result object that summarizes the XO key, partial matches, exact matches, and if the guess was correct/won
    # xo_key returns "XXXX" if perfect guess. returns XXO, for example, if two perfect guesses and one right digit but wrong place
    def self.evaluate_guess(secret_code, guess)
      #make arguments immutable
      secret_code.freeze
      guess.freeze

      result = MM::GuessEvaluatorResult.new

      resX = generate_Xs_for_exact_matches(secret_code, guess, [])
      result.exact_match_values = find_exact_matches_from_secret_code(secret_code, guess, [])
      secret_code_remaining = trim_exact_matches_from_secret_code(secret_code, guess, [])
      guess_remaining = trim_exact_matches_from_guess(secret_code, guess, [])
      resO = generate_Os_for_partial_matches(secret_code_remaining, guess_remaining)
      result.xo_key = resX.concat resO
      result.partial_match_values = values_of_partial_matches(secret_code_remaining, guess_remaining)
      result.is_won = (result.xo_key == ("X" * secret_code.size).chars)
      result
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

    def self.find_exact_matches_from_secret_code(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?
      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        find_exact_matches_from_secret_code(tail_code, tail_guess, accum.push(head_code))
      else
        find_exact_matches_from_secret_code(tail_code, tail_guess, accum)
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
      secret_code.freeze
      guess.freeze

      secret_code_copy = secret_code.sort
      guess_copy = guess.sort
      find_partial_matches_helper(secret_code_copy, guess_copy, [])
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

    def self.values_of_partial_matches(secret_code, guess)
      secret_code.freeze
      guess.freeze

      secret_code_copy = secret_code.sort
      guess_copy = guess.sort
      values_of_partial_matches_helper(secret_code_copy, guess_copy, [])
    end

    def self.values_of_partial_matches_helper(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?

      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        #could push either head_code or guess, won't matter since equal
        values_of_partial_matches_helper(tail_code, tail_guess, accum.push(head_guess))
      elsif head_code > head_guess
        values_of_partial_matches_helper(secret_code, tail_guess, accum)
      elsif head_code < head_guess
        values_of_partial_matches_helper(tail_code, guess, accum)
      end
    end
  end
end
