module MM
  class BoardPresenterTerminal
    attr_accessor :board

    def present_board(board)
      @board = board
      present_board_and_results(self.board)
    end

    def present_board_only(board)
      #board.display_values will return multidimensional array
      display_values.each_with_index do |row, row_number|
        row.each_with_index do |display_value, index|
          #http://www.evc-cit.info/cit020/beginning-programming/chp_04/file_printf.html
          if display_value == nil
            print "  "
          else
            printf "%2s", display_value
          end

          print " | " unless index == (row.size - 1)
        end
        print "\n"
        puts "_"*(row.size * 5) unless row_number.equal? (number_of_rows - 1)
      end
    end

    def present_board_and_results(board)
      @board = board

      print "     Guess" + "                    " +"Result"
      print "\n"
      puts "-" * 40
      guesses_and_results = display_values.zip(result_values)
      #board.display_values will return multidimensional array
      guesses_and_results.each do |values|
        #values is either display_values or result_values
        values.each_with_index do |row, row_number|
          row.each_with_index do |display_value, index|
            #http://www.evc-cit.info/cit020/beginning-programming/chp_04/file_printf.html
            if display_value == nil
              print "  "
            else
              printf "%2s", display_value
            end

            print " | " unless index == (row.size - 1)
          end
          print "       " unless row.equal? values.last
        end
        print "\n"
        puts "_"*(values.size * 20) unless values.equal? guesses_and_results.last
      end
    end

    def display_values
      board.display_values
    end

    def result_values
      board.result_values
    end

    def number_of_rows
      board.number_of_rows
    end

  end
end