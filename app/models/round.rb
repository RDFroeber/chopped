class Round < ActiveRecord::Base
  validates :episode_id, presence: true

  belongs_to :episode
  has_many :dishes
end