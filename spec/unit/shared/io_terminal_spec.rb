require_relative '../../../lib/games/shared/io_terminal'
require_relative '../../shared_examples/shared/io'

RSpec.describe Games::Shared::IOTerminal do
  it_behaves_like "io_presenter_receiver"
  let(:io_presenter_receiver) { Games::Shared::IOTerminal.new }

  context "terminal" do
    let(:prompt) { "Hello, this is a test" }

    it "prints output" do
      #newline added because io_presenter uses "puts" which automatically adds a newline
      expect { io_presenter_receiver.present_with_new_line(prompt)}.to output("Hello, this is a test\n").to_stdout
    end
  end

  context "terminal" do
    before do
      $stdin = StringIO.new("Input test")
    end

    after do
      $stdin = STDIN
    end

    it "receives input" do
      expect(io_presenter_receiver.receive).to eq("Input test")
    end
  end
end

