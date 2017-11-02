RSpec.shared_examples "MMPeg-able" do
  it { is_expected.to respond_to(:display_value) }
end