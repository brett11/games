RSpec.shared_examples "TTTGame ComputerNoviceMakeMove-able" do
  it { is_expected.to respond_to(:available_choices) }
  it { is_expected.to respond_to(:computer_choosing_graphic) }
end

RSpec.shared_examples "TTTGame ComputerExpertMakeMove-able" do
  it { is_expected.to respond_to(:computer_choosing_graphic) }
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:number_of_turns_taken) }
  it { is_expected.to respond_to(:player_1_value) }
  it { is_expected.to respond_to(:player_2_value) }
end

RSpec.shared_examples "TTTGame HumanPlayerMakeMove-able" do
  it { is_expected.to respond_to(:get_player_choice) }
  it { is_expected.to respond_to(:current_player_name) }
  it { is_expected.to respond_to(:available_choices) }
end