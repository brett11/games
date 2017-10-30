RSpec.shared_examples "game interface" do
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:board_presenter) }
  it { is_expected.to respond_to(:board_builder) }
  it { is_expected.to respond_to(:players) }
  it { is_expected.to respond_to(:io) }
  it { is_expected.to respond_to(:io_helpers) }
  it { is_expected.to respond_to(:game_module) }

  it { is_expected.to respond_to(:play) }
end

RSpec.shared_examples "game subclass" do
  it { is_expected.to respond_to(:over?) }
  it { is_expected.to respond_to(:over_with_no_winner?) }
  it { is_expected.to respond_to(:won?) }
end