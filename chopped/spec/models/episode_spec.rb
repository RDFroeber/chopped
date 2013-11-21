require 'spec_helper'

describe Episode do
  let(:ep) {Episode.new(title: "The Greatest")}

  it "is valid with a title" do
    expect(ep).to be_valid
  end

  it "is invalid without a title" do
    ep.title = nil
    expect(ep).to have(1).errors_on(:title)
  end

  describe "#create_rounds" do
    before {ep.save}

    it "is valid with 3 rounds" do
      expect(ep.rounds.count).to eq(3)
    end

    context "has less than 3 rounds" do
      before do
        ep.rounds.pop
      end

      it "raises an error" do
        expect {ep.create_rounds}.to raise_error("Stop that.")
      end
    end

    context "has greater than 3 rounds" do
      before do
        ep.rounds << Round.create(episode: ep)
      end

      it "is invalid" do
        expect {ep.create_rounds}.to raise_error("Too many rounds.")
      end
    end
  end

end