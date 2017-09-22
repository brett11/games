RSpec.shared_examples "player interface" do
  it { is_expected.to respond_to(:name) }
  it { is_expected.to respond_to(:type) }
  it { is_expected.to respond_to(:difficulty_level) }
end