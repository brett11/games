require_relative '../../../lib/games/tictactoe/players_factory'

RSpec.describe TTT::PlayersFactory do
  describe "factory" do
    let(:io_helpers) { instance_double "TTT::IOHelpers" }
    let(:players_factory) { TTT::PlayersFactory.new(io_helpers) }

    describe "two human new players " do
      before do
        expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
        expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
        expect(io_helpers).to receive(:get_player_value).and_return("R")
        expect(io_helpers).to receive(:get_player_2_type).and_return(:human)
        expect(io_helpers).to receive(:is_player_2_saved?).and_return(false)
        expect(io_helpers).to receive(:get_opponent_name).and_return("Bob")
        expect(io_helpers).to receive(:get_player_value).and_return("D")
      end

      it "#generate_players" do
        players = players_factory.generate_players
        player_1 = players[0]
        player_2 = players[1]
        expect(player_1).to be_kind_of(TTT::HumanPlayer)
        expect(player_1.name).to eq("Brett")
        expect(player_1.value).to eq("R")
        expect(player_2).to be_kind_of(TTT::HumanPlayer)
        expect(player_2.name).to eq("Bob")
        expect(player_2.value).to eq("D")
      end
    end

    describe "two human saved players " do
      before do
        expect(io_helpers).to receive(:is_player_1_saved?).and_return(true)
        expect(io_helpers).to receive(:get_player_value).and_return("R")
        expect(io_helpers).to receive(:is_player_2_saved?).and_return(true)
        expect(io_helpers).to receive(:get_player_value).and_return("D")
      end

      it "#generate_players" do
        pending "saved player functionality not implemented yet"
      end
    end

    describe "one human saved player and one human new player" do
      before do
        expect(io_helpers).to receive(:is_player_1_saved?).and_return(true)
        expect(io_helpers).to receive(:get_player_value).and_return("R")
        expect(io_helpers).to receive(:is_player_2_saved?).and_return(false)
        expect(io_helpers).to receive(:get_opponent_name).and_return("Bob")
        expect(io_helpers).to receive(:get_player_value).and_return("D")
      end

      it "#generate_players" do
        pending "saved player functionality not implemented yet"
      end
    end

    describe "one human new player and one computer novice" do
      before do
        expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
        expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
        expect(io_helpers).to receive(:get_player_value).and_return("R")
        expect(io_helpers).to receive(:get_player_2_type).and_return(:computer)
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:novice)
      end

      it "#generate_players" do
        players = players_factory.generate_players
        player_1 = players[0]
        player_2 = players[1]
        expect(player_1).to be_kind_of(TTT::HumanPlayer)
        expect(player_1.name).to eq("Brett")
        expect(player_1.value).to eq("R")
        expect(player_2).to be_kind_of(TTT::ComputerPlayerNovice)
        expect(player_2.name).to eq("Computer")
        #computer default token value is "O"
        expect(player_2.value).to eq("O")
      end
    end

    describe "one human new player and one computer expert" do
      before do
        expect(io_helpers).to receive(:is_player_1_saved?).and_return(false)
        expect(io_helpers).to receive(:get_player_1_name).and_return("Brett")
        expect(io_helpers).to receive(:get_player_value).and_return("R")
        expect(io_helpers).to receive(:get_player_2_type).and_return(:computer)
        expect(io_helpers).to receive(:get_computer_knowledge_level).and_return(:expert)
      end

      it "#generate_players" do
        players = players_factory.generate_players
        player_1 = players[0]
        player_2 = players[1]
        expect(player_1).to be_kind_of(TTT::HumanPlayer)
        expect(player_1.name).to eq("Brett")
        expect(player_1.value).to eq("R")
        expect(player_2).to be_kind_of(TTT::ComputerPlayerExpert)
        expect(player_2.name).to eq("Computer")
        #computer default token value is "O"
        expect(player_2.value).to eq("O")
      end
    end
  end
end