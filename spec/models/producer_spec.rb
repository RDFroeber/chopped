require 'spec_helper'

describe Producer do
  context "An Episode" do
    let(:ep) {Episode.new(title: "The Greatest")}
    let(:prod) {Producer.new(ep)}

    describe "#brainstorm_rounds" do
      before {ep.save}

      it "is valid with 3 rounds" do
        expect(ep.rounds.count).to eq(3)
      end

      context "already has 3 rounds" do
        it "raises an error" do
          expect {prod.brainstorm_rounds}.to raise_error("You already have three rounds.")
        end
      end

      context "has less than 3 rounds" do
        before do
          ep.rounds.first.delete
        end

        it "raises an error" do
          expect {prod.brainstorm_rounds}.to raise_error("Stop that. You must have three rounds.")
        end
      end

      context "has greater than 3 rounds" do
        before do
          ep.rounds << Round.create(episode: ep)
        end

        it "is invalid" do
          expect {prod.brainstorm_rounds}.to raise_error("You cannot have more than three rounds.")
        end
      end
    end

    describe "#research_judges" do
      before {ep.save}

      it "is valid with 3 judges" do
        expect(ep.judges.count).to eq(3)
      end

      context "already has 3 judges" do
        it "raises an error" do
          expect {prod.research_judges}.to raise_error("You already have three judges.")
        end
      end

      context "has less than 3 judges" do
        before do
          ep.judges.first.delete
        end

        it "raises an error" do
          expect {prod.research_judges}.to raise_error("Stop that. You must have three judges.")
        end
      end

      context "has greater than 3 judges" do
        before do
          ep.judges << Judge.create(name: "McKenneth", episode: ep)
        end

        it "is invalid" do
          expect {prod.research_judges}.to raise_error("You cannot have more than three judges.")
        end
      end
    end

    describe "#find_chefs" do
      before {ep.save}

      it "is valid with 4 chefs" do
        expect(ep.chefs.count).to eq(4)
      end

      context "already has 4 chefs" do
        it "raises an error" do
          expect {prod.find_chefs}.to raise_error("You already have four chefs.")
        end
      end

      context "has less than 4 chefs" do
        before do
          ep.chefs.first.delete
        end

        it "raises an error" do
          expect {prod.find_chefs}.to raise_error("Stop that. You must have four chefs.")
        end
      end

      context "has greater than 4 chefs" do
        before do
          ep.chefs << Chef.create(name: "Perry", episode: ep)
        end

        it "is invalid" do
          expect {prod.find_chefs}.to raise_error("You cannot have more than four chefs.")
        end
      end
    end
  end
end