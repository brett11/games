RSpec.shared_examples "TTTIOHelpers game-able" do
  it { is_expected.to respond_to(:initial_instructions) }
  it { is_expected.to respond_to(:winning_prompt) }
  it { is_expected.to respond_to(:no_winner_prompt) }
  it { is_expected.to respond_to(:custom_final_message) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:is_player_1_saved?) }
  it { is_expected.to respond_to(:is_player_2_saved?) }
  it { is_expected.to respond_to(:get_player_1_name) }
  it { is_expected.to respond_to(:get_player_2_name) }
  it { is_expected.to respond_to(:get_player_2_type) }
  it { is_expected.to respond_to(:get_player_value) }
  it { is_expected.to respond_to(:computer_choosing_graphic) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:get_number_of_rows_cols_max_3) }
  it { is_expected.to respond_to(:get_number_of_rows_cols_max_9) }
  it { is_expected.to respond_to(:get_player_choice) }
  it { is_expected.to respond_to(:get_computer_knowledge_level) }
end

RSpec.shared_examples "TTTIOHelpers PlayersFactory-able" do
  it { is_expected.to respond_to(:is_player_1_saved?) }
  it { is_expected.to respond_to(:is_player_2_saved?) }
  it { is_expected.to respond_to(:get_player_1_name) }
  it { is_expected.to respond_to(:get_player_2_name) }
  it { is_expected.to respond_to(:get_player_2_type) }
  it { is_expected.to respond_to(:get_player_value) }
  it { is_expected.to respond_to(:computer_choosing_graphic) }
  it { is_expected.to respond_to(:new_game_starting_graphic) }
  it { is_expected.to respond_to(:get_number_of_rows_cols_max_3) }
  it { is_expected.to respond_to(:get_number_of_rows_cols_max_9) }
  it { is_expected.to respond_to(:get_player_choice) }
  it { is_expected.to respond_to(:get_computer_knowledge_level) }
end