require_relative "../../../lib/games/mastermind/peg"
require_relative "../../../lib/games/mastermind/pegs"
require_relative '../../../lib/games/mastermind/pegs_factory'

RSpec.describe MM::Pegs do
  describe "factory" do
    context "creates empty board" do
      let(:pegs) { MM::PegsFactory.build_empty_pegs}

      it "holds a collection of pegs" do
        expect(pegs.collection_of_pegs).to respond_to(:each)
      end

      context "and returns the correct" do
        specify "#display_values" do
          expect(pegs.display_values).to eq([ [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                              [nil, nil, nil, nil ],
                                                ] )
        end
      end

      it "#retrieves_peg" do
        expect(pegs.retrieve_peg(11,3)).to_not be_nil
      end

      it "#retrieve_peg returns nil that does not match peg" do
        expect(pegs.retrieve_peg(12,4)).to be_nil
      end
    end
  end
end