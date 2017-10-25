RSpec.shared_examples "setup-able" do
  it { is_expected.to respond_to(:one_time_setup) }
  it { is_expected.to respond_to(:every_time_setup) }
end