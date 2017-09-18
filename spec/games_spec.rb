require "spec_helper"

RSpec.describe Games do
  it "has a version number" do
    expect(Games::VERSION).not_to be nil
  end

  it "does something useful" do
    expect(false).to eq(true)
  end
end
