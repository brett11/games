RSpec.shared_examples "MMGame ComputerNoviceMakeMove-able" do
  it { is_expected.to respond_to(:computer_choosing_graphic) }
end

RSpec.shared_examples "MMGame ComputerExpertMakeMove-able" do
  it { is_expected.to respond_to(:computer_choosing_graphic) }
  it { is_expected.to respond_to(:current_result_partial_match_values) }
  it { is_expected.to respond_to(:current_result_exact_match_values) }

end

RSpec.shared_examples "MMGame HumanPlayerMakeMove-able" do
  it { is_expected.to respond_to(:get_player_choice) }
  it { is_expected.to respond_to(:current_player_name) }
end