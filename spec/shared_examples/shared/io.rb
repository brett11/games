RSpec.shared_examples "IOHelpers-able" do
  it { is_expected.to respond_to(:present) }
  it { is_expected.to respond_to(:present_with_new_line) }
  it { is_expected.to respond_to(:receive) }
end