RSpec.shared_examples "game interface" do
  it { is_expected.to respond_to(:board) }
  it { is_expected.to respond_to(:board_presenter) }
  it { is_expected.to respond_to(:board_builder) }
  it { is_expected.to respond_to(:players) }
  it { is_expected.to respond_to(:io_helpers) }

  it { is_expected.to respond_to(:play) }
end

RSpec.shared_examples "game subclass" do
  it { is_expected.to respond_to(:over?) }
  it { is_expected.to respond_to(:no_more_turns?) }
  it { is_expected.to respond_to(:won?) }
end