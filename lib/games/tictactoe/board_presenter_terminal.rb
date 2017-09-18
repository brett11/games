module TTT
  class BoardPresenterTerminal
    def present_board(board)
      #board.display_values will return multidimensional array
      display_values = board.display_values
      display_values.each do |row|
        row.each_with_index do |display_value, index|
          #http://www.evc-cit.info/cit020/beginning-programming/chp_04/file_printf.html
          printf "%2s", display_value
          print " | " unless index == (row.size - 1)
        end
        print "\n"
        puts "_"*(row.size * 5) unless row.equal? display_values.last
      end
    end
  end
end