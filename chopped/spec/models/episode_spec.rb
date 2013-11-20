require 'spec_helper'

describe Episode do
  let(:ep) {Episode.new(title: "The Greatest")}

  it 'is valid with a title' do
    expect(ep).to be_valid
  end

  it "is invalid without a title" do
    ep.title = nil
    expect(ep).to have(1).errors_on(:title)
  end

end