require_relative '../shared/array_iterator'

module MM
  class GuessEvaluator
    attr_accessor :secret_code
    attr_accessor :guess
    attr_accessor :result

    def evaluate_guess(secret_code, guess)
      @secret_code = Marshal.load(Marshal.dump(secret_code))
      @guess = Marshal.load(Marshal.dump(guess))
      #default when game starts is to have empty current_guess array
      if guess.empty?
        return []
      end
      @result = find_result
      return result
    end

    def find_result
      resX = find_exact_matches
      resO = find_partial_matches
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

    def find_partial_matches
      resO = []
      return resO if secret_code.empty? || guess.empty?
      secret_code.sort!
      guess.sort!

      secret_code_iterator = ArrayIterator.new(secret_code)
      guess_iterator = ArrayIterator.new(guess)

      #get first elements from enums
      code_element = secret_code_iterator.next_item
      guess_element = guess_iterator.next_item


      while secret_code_iterator.has_next? || guess_iterator.has_next?
        if guess_element == code_element
          resO.push("O")
          if secret_code_iterator.has_next? && guess_iterator.has_next?
            code_element = secret_code_iterator.next_item
            guess_element = guess_iterator.next_item
          else
            break
          end
        elsif guess_element > code_element
          if secret_code_iterator.has_next?
            code_element = secret_code_iterator.next_item
          else
            break
          end
        else
          if guess_iterator.has_next?
            guess_element = guess_iterator.next_item
          else
            break
          end
        end
      end
      resO
    end
  end
end
