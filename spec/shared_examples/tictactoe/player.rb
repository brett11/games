RSpec.shared_examples "tic tac toe player" do
  it { is_expected.to respond_to(:value) }
  it { is_expected.to respond_to(:make_move) }
end