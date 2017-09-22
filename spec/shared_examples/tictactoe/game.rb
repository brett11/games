RSpec.shared_examples "game subclass" do
  it { is_expected.to respond_to(:over?) }
  it { is_expected.to respond_to(:no_winner?) }
  it { is_expected.to respond_to(:won?) }
end

RSpec.shared_examples "move_generator-able" do
  it { is_expected.to respond_to(:available_choices) }
  it { is_expected.to respond_to(:game_module) }
  it { is_expected.to respond_to(:current_player) }
  it { is_expected.to respond_to(:input_helper) }
  it { is_expected.to respond_to(:current_player_human?) }
  it { is_expected.to respond_to(:current_player_computer?) }
  it { is_expected.to respond_to(:current_player_difficult_computer?) }
  it { is_expected.to respond_to(:current_player_easy_computer?) }
end

RSpec.shared_examples "game_state_changer-able" do
  it { is_expected.to respond_to(:change_square) }
  it { is_expected.to respond_to(:won?) }
  it { is_expected.to respond_to(:move_forward_one_turn) }
end

RSpec.shared_examples "game_resetter-able" do
  it { is_expected.to respond_to(:number_of_turns_taken) }
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:generate_empty_board) }
  it { is_expected.to respond_to(:config) }
end

RSpec.shared_examples "minimax-able" do
  it { is_expected.to respond_to(:over?) }
  it { is_expected.to respond_to(:change_game_state) }
  it { is_expected.to respond_to(:current_player) }
  it { is_expected.to respond_to(:available_choices) }
  it { is_expected.to respond_to(:won?) }
  it { is_expected.to respond_to(:winner) }
  it { is_expected.to respond_to(:players) }

end