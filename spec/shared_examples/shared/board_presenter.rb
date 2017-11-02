RSpec.shared_examples "PresentBoard-able" do
  it { is_expected.to respond_to(:present_board) }
end