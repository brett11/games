RSpec.shared_examples "board presenter-able" do
  it { is_expected.to respond_to(:display_values) }
end
