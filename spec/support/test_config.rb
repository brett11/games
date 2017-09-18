module TestConfig
  #board_config should be multi dimensional array, 9 elements, 1-9 as first element in subarray, desired value as second element

  @board_config_full = [
    [ [1, "X"] , [2, "O"] , [3, "X"]   ],
    [ [4, "O"] , [5, "X"] , [6, "X"]   ],
    [ [7, "O"] , [8, "X"] , [9, "O"]   ]
  ]

  @board_config_full_draw = [
    [ [1, "X"] , [2, "O"] , [3, "X"]   ],
    [ [4, "O"] , [5, "X"] , [6, "X"]   ],
    [ [7, "O"] , [8, "X"] , [9, "O"]   ]
  ]

  @board_config_full_won = [
    [ [1, "X"] , [2, "X"] , [3, "X"]   ],
    [ [4, "X"] , [5, "O"] , [6, "O"]   ],
    [ [7, "O"] , [8, "O"] , [9, "X"]   ]
  ]

  @board_config_empty = [
    [ [1, nil] , [2, nil] , [3, nil]    ],
    [ [4, nil] , [5, nil] , [6, nil]   ],
    [ [7, nil] , [8, nil] , [9, nil]   ]
  ]

  @board_config_partial = [
    [ [1, nil] , [2, nil] , [3, nil]   ],
    [ [4, nil] , [5, nil] , [6, "O"]   ],
    [ [7, "X"] , [8, "X"] , [9, "O"]   ]
    ]

  class << self
    attr_reader :board_config_full, :board_config_full_won, :board_config_full_draw, :board_config_empty, :board_config_partial
  end
end