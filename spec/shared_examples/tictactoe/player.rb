RSpec.shared_examples "TTTPlayer Game-able" do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:value) }
  it { is_expected.to respond_to(:make_move) }
end

RSpec.shared_examples "TTTPlayer subclass" do
  it { is_expected.to respond_to(:value) }
  it { is_expected.to respond_to(:make_move) }
end