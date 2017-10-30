RSpec.shared_examples "tictactoe move_generator-able" do
  it { is_expected.to respond_to(:available_choices) }
  it { is_expected.to respond_to(:game_module) }
  it { is_expected.to respond_to(:current_player) }
  it { is_expected.to respond_to(:io_helpers) }
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:number_of_turns_taken) }
  it { is_expected.to respond_to(:player_1_value) }
  it { is_expected.to respond_to(:player_2_value) }
end

RSpec.shared_examples "tictactoe game_state_changer-able" do
  it { is_expected.to respond_to(:change_square) }
  it { is_expected.to respond_to(:current_player_value) }
  it { is_expected.to respond_to(:won?) }
  it { is_expected.to respond_to(:move_forward_one_turn) }
end

RSpec.shared_examples "tictactoe game_resetter-able" do
  it { is_expected.to respond_to(:number_of_turns_taken) }
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:generate_empty_board) }
end
