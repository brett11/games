require "spec_helper"

RSpec.describe Games do
  it "has a version number" do
    expect(Games::VERSION).not_to be nil
  end
end
