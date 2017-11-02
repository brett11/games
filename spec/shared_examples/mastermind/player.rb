RSpec.shared_examples "MMPlayer Game-able" do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:make_move) }
end