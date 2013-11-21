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

    it "is invalid with less than or greater than 3 rounds" do
      # ep.rounds = nil
      expect(ep.rounds.count).to_not be < (3)
      expect(ep.rounds.count).to_not be > (3)
    end
  end

end