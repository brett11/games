RSpec.shared_examples "TTTBoardPresenter-able" do
  it { is_expected.to respond_to(:display_values) }
  it { is_expected.to respond_to(:number_of_rows_cols) }
end

RSpec.shared_examples "TTTBoardMinimax-able" do
  it { is_expected.to respond_to(:won?) }
  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:available_choices) }
end