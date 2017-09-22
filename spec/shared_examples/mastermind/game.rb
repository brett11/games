RSpec.shared_examples "mastermind move_generator-able" do
  it { is_expected.to respond_to(:input_helper) }
end

RSpec.shared_examples "mastermind game_state_changer-able" do
  it { is_expected.to respond_to(:won?) }
  it { is_expected.to respond_to(:move_forward_one_turn) }
end

RSpec.shared_examples "mastermind game_resetter-able" do
  it { is_expected.to respond_to(:number_of_turns_taken) }
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:generate_empty_board) }
  it { is_expected.to respond_to(:config) }
end
