module Games::Shared
  class IOTerminal
    def present(prompt)
      print prompt
    end

    def present_with_new_line(prompt)
      puts prompt
    end

    def receive
      result = gets.chomp
      if is_int?(result)
        return result.to_i
      else
        return result.chomp
      end
    end

    private
    def is_int?(figure)
      Integer(figure) rescue false
    end
  end
end