RSpec.shared_examples "TTTSquare-able" do
  it { is_expected.to respond_to(:display_value) }
  it { is_expected.to respond_to(:value) }
  it { is_expected.to respond_to(:empty?) }
  it { is_expected.to respond_to(:full?) }
end