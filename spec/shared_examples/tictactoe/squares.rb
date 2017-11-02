RSpec.shared_examples "TTTSquares-able" do
  it { is_expected.to respond_to(:full?) }
  it { is_expected.to respond_to(:any_combination_won?) }
  it { is_expected.to respond_to(:display_values) }
  it { is_expected.to respond_to(:available_choices) }
  it { is_expected.to respond_to(:number_of_rows_cols) }
  it { is_expected.to respond_to(:retrieve_square) }
end