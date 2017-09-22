RSpec.shared_examples "io_presenter_receiver" do
  it { is_expected.to respond_to(:present) }
  it { is_expected.to respond_to(:receive) }
end