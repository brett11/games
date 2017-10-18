RSpec.shared_examples "tictactoe players_factory-able" do
  it { is_expected.to respond_to(:player_1_name) }
  it { is_expected.to respond_to(:player_1_value) }
  it { is_expected.to respond_to(:player_2_type) }
  it { is_expected.to respond_to(:player_2_name) }
  it { is_expected.to respond_to(:player_2_value) }
  it { is_expected.to respond_to(:computer_difficulty_level) }
end


RSpec.shared_examples "board-builder-able" do
  it { is_expected.to respond_to(:number_of_rows_cols) }
end




