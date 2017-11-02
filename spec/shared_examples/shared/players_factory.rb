RSpec.shared_examples "PlayersFactory Game-able" do
  it { is_expected.to respond_to(:generate_players) }
end