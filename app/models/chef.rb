class Chef < ActiveRecord::Base
  validates :name, :episode_id, presence: true

  belongs_to :episode
  has_many :dishes
end