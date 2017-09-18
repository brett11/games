RSpec.shared_examples "sets up player 1" do
  #config must be set by let statement of example
  it "sets up player 1" do
    expect(config.player_1_name).to eq("Brett")
    expect(config.player_1_value).to eq("X")
  end
end