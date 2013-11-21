require 'spec_helper'

describe Dish do
  let(:ep) {Episode.create(title: "The Greatest")}
  let(:first) {ep.rounds.first}
  let(:giada) {ep.chefs.first}
  let(:dish) {Dish.new(name: "Shredded Chicken and Tomatillo Tacos with Queso Fresco", chef: giada, round: first)}

  it "is valid with a name, chef_id, and round_id" do
    expect(dish).to be_valid
  end

  it "is invalid without a name" do
    dish.name = nil
    expect(dish).to have(1).errors_on(:name)
  end

  it "is invalid without an chef_id" do
    dish.chef_id = nil
    expect(dish).to have(1).errors_on(:chef_id)
  end

  it "is invalid without an round_id" do
    dish.round_id = nil
    expect(dish).to have(1).errors_on(:round_id)
  end

  it "belongs to a Chef" do
    expect(dish.chef).to be_an_instance_of(Chef)
  end

  it "belongs to a Round" do
    expect(dish.round).to be_an_instance_of(Round)
  end

end