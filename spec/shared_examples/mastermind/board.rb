RSpec.shared_examples "board presenter-able" do
  it { is_expected.to respond_to(:display_values) }
  it { is_expected.to respond_to(:result_values) }
  it { is_expected.to respond_to(:number_of_rows) }
end
