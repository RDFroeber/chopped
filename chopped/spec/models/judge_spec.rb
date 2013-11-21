require 'spec_helper'

describe Judge do
  let(:ep) {Episode.create(title: "The Greatest")}
  let(:judge) {Judge.new(name: "Alfredo", episode: ep, attitude: "Saucy")}

  it "is valid with a name and episode_id" do
    expect(judge).to be_valid
  end

  it "is invalid without a name" do
    judge.name = nil
    expect(judge).to have(1).errors_on(:name)
  end

  it "is invalid without an episode_id" do
    judge.episode_id = nil
    expect(judge).to have(1).errors_on(:episode_id)
  end

  it "belongs to an Episode" do
    expect(judge.episode).to be_an_instance_of(Episode)
  end

  describe "#attitude" do
    it "returns its attitude" do
      expect(judge.attitude).to eq("Saucy")
    end
  end
end