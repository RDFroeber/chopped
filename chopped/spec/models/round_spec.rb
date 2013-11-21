require 'spec_helper'

describe Round do
  let(:ep) {Episode.create(title: "The Greatest")}
  let(:round) {Round.new(episode: ep, ingredient: "Cat nip")}

  it "is valid with an episode_id" do
    expect(round).to be_valid
  end

  it "is invalid without an episode_id" do
    round.episode_id = nil
    expect(round).to have(1).errors_on(:episode_id)
  end

  it "belongs to an Episode" do
    expect(round.episode).to be_an_instance_of(Episode)
  end

  describe "#ingredient" do
    it "returns its ingredient" do
      expect(round.ingredient).to eq("Cat nip")
    end
  end
end