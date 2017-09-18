RSpec.shared_examples "board_presenter" do
  it { is_expected.to respond_to(:present_board) }
end