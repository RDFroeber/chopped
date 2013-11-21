require 'spec_helper'

describe Chef do
  let(:ep) {Episode.create(title: "The Greatest")}
  let(:chef) {Chef.new(name: "Flobby Bay", episode: ep)}

  it "is valid with a name and episode_id" do
    expect(chef).to be_valid
  end

  it "is invalid without a name" do
    chef.name = nil
    expect(chef).to have(1).errors_on(:name)
  end

  it "is invalid without an episode_id" do
    chef.episode_id = nil
    expect(chef).to have(1).errors_on(:episode_id)
  end

  it "belongs to an Episode" do
    expect(chef.episode).to be_an_instance_of(Episode)
  end
  
end