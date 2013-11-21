class Dish < ActiveRecord::Base
  validates :name, :chef_id, :round_id, presence: true

  belongs_to :chef
  belongs_to :round
end