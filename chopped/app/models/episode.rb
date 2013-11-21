class Episode < ActiveRecord::Base
  validates :title, presence: true

  has_many :rounds
  has_many :judges

  after_save :produce_episode


  def produce_episode 
    fabio = Producer.new(self)
    fabio.research_judges
    fabio.brainstorm_rounds
  end
end