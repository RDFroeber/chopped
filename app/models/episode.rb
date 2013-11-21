class Episode < ActiveRecord::Base
  validates :title, presence: true

  has_many :rounds
  has_many :judges

  after_save :produce_episode

  def produce_episode 
    producer = Producer.new(self)
    producer.research_judges
    producer.brainstorm_rounds

    producer
  end
end