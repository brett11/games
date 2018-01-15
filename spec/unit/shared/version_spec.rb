require 'games/version'

RSpec.describe do
  it "is correct version" do
    expect(Games::VERSION).to eq('0.6.0')
  end
end