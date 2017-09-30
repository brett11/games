module MM
  class BoardPresenterTerminal
    attr_accessor :board

    def present_board(board)
      @board = board
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

    def display_values
      board.display_values
    end

    def number_of_rows
      board.number_of_rows
    end

  end
end