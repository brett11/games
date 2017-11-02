RSpec.shared_examples "SharedBoardBuilder Game-able" do
  it { is_expected.to respond_to(:generate_empty_board) }
end
