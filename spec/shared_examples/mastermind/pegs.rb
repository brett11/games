RSpec.shared_examples "MMPegs-able" do
  it { is_expected.to respond_to(:display_values) }
  it { is_expected.to respond_to(:current_row) }
  it { is_expected.to respond_to(:retrieve_peg) }
end