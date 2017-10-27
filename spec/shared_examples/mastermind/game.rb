RSpec.shared_examples "mastermind move_generator-able" do
  it { is_expected.to respond_to(:current_player) }
  it { is_expected.to respond_to(:io_helpers) }
  it { is_expected.to respond_to(:current_player_human?) }
  it { is_expected.to respond_to(:number_of_rows) }
end

RSpec.shared_examples "mastermind game_state_changer-able" do
  it { is_expected.to respond_to(:current_guess) }
  it { is_expected.to respond_to(:evaluate_guess) }
  it { is_expected.to respond_to(:current_result) }
  it { is_expected.to respond_to(:won?) }
  it { is_expected.to respond_to(:move_forward_one_turn) }
  it { is_expected.to respond_to(:pegs_current_row) }
  it { is_expected.to respond_to(:result_pegs_current_row) }
  it { is_expected.to respond_to(:secret_code) }
end

RSpec.shared_examples "mastermind game_resetter-able" do
  it { is_expected.to respond_to(:number_of_turns_taken) }
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:generate_empty_board) }
  it { is_expected.to respond_to(:config) }
end
