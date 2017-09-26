RSpec.shared_examples "mastermind players_factory-able" do
  it { is_expected.to respond_to(:player_1_name) }
end

RSpec.shared_examples "mastermind board builder-able" do
  it { is_expected.to respond_to(:number_of_rows) }
  it { is_expected.to respond_to(:number_of_cols) }
end


