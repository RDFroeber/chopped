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

  describe "it has many relationships" do
    before {ep.save}

    it "it can have many rounds" do
      expect(ep.rounds.first).to be_an_instance_of(Round)
    end

    it "it can have many judges" do
      expect(ep.judges.first).to be_an_instance_of(Judge)
    end
  end

  describe "#produce_episode" do
    it "hires a producer" do
      expect(ep.produce_episode).to be_an_instance_of(Producer)
    end
  end

end