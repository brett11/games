RSpec.shared_examples "player subclass" do
  it { is_expected.to respond_to(:name) }
end

RSpec.shared_examples "mastermind make_move-able" do
  it { is_expected.to respond_to(:make_move) }
end

RSpec.shared_examples "tictactoe make_move-able" do
  it { is_expected.to respond_to(:make_move) }
end