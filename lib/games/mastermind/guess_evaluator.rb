require_relative '../shared/array_iterator'
require 'set.rb'

module MM
  class GuessEvaluator
    attr_accessor :secret_code
    attr_accessor :guess
    attr_accessor :result

    # returns "XXXX" if perfect guess. returns XXO, for example, if two perfect guesses and one right digit but wrong place
    def evaluate_guess(secret_code, guess)
      @secret_code = Marshal.load(Marshal.dump(secret_code))
      @guess = Marshal.load(Marshal.dump(guess))
      #default when game starts is to have empty current_guess array
      if guess.empty?
        return []
      end
      @result = find_result
    end

    def find_result
      resX = find_exact_matches
      resO = sort_and_find_partial_matches
      resX.concat resO
    end

    def find_exact_matches
      resX = []
      set_of_matched_indexes = Set.new
      guess.each_with_index do |element, index|
        if element == secret_code[index]
          resX.push ("X")
          set_of_matched_indexes.add(index)
        end
      end
      delete_elements_already_matched(set_of_matched_indexes)
      resX
    end

    def delete_elements_already_matched(set_of_matched_indexes)
      secret_code.delete_if.with_index { |_, index| set_of_matched_indexes.include? index }
      guess.delete_if.with_index { |_, index| set_of_matched_indexes.include? index }
    end

    def sort_and_find_partial_matches
      secret_code.sort!
      guess.sort!
      find_partial_matches(secret_code, guess, [])
    end

    def find_partial_matches(secret_code, guess, accum)
      return accum if secret_code.empty? || guess.empty?

      head_code, *tail_code = secret_code
      head_guess, *tail_guess = guess

      if head_code == head_guess
        find_partial_matches(tail_code, tail_guess, accum.push("O"))
      elsif head_code > head_guess
        find_partial_matches(secret_code, tail_guess, accum)
      elsif head_code < head_guess
        find_partial_matches(tail_code, guess, accum)
      end
    end
  end
end
