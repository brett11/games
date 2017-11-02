require_relative '../../../lib/games/mastermind/players_factory'
require_relative '../../../lib/games/mastermind/io_helpers'
require_relative '../../../spec/shared_examples/shared/players_factory'

RSpec.describe TTT::PlayersFactory do
  describe "factory" do
    let(:io_helpers) { instance_double "MM::IOHelpers" }
    let(:players_factory) { MM::PlayersFactory.new(io_helpers) }

    subject { MM::PlayersFactory.new(io_helpers) }
    it_behaves_like "PlayersFactory Game-able"

    describe "one human new player" do
      before do
        expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:human)
        expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
      end

      specify "#generate_player" do
        players = players_factory.generate_players
        player_1 = players[0]
        expect(player_1).to be_kind_of(MM::HumanPlayer)
        expect(player_1.name).to eq("Brett")
      end
    end

    describe "one human saved player" do
      before do
        expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:human)
      end

      specify "#generate_player" do
        pending "saved player not implemented yet"
      end
    end

    describe "one computer novice player" do
      before do
        expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:computer)
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:novice)
      end

      specify "#generate_player" do
        players = players_factory.generate_players
        player_1 = players[0]
        expect(player_1).to be_kind_of(MM::ComputerPlayerNovice)
        expect(player_1.name).to eq("Computer")
      end
    end

    describe "one computer expert player" do
      before do
        expect(io_helpers).to receive(:computer_or_human_guesser_inquiry).and_return(:computer)
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:expert)
      end

      specify "#generate_player" do
        players = players_factory.generate_players
        player_1 = players[0]
        expect(player_1).to be_kind_of(MM::ComputerPlayerExpert)
        expect(player_1.name).to eq("Computer")
      end
    end
  end
end


