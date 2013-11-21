class Episode < ActiveRecord::Base
  validates :title, presence: true

  has_many :rounds

  after_save :create_rounds

  private 
  
  def create_rounds
    self.rounds << Round.create(ingredient: "Paprika", episode: self)
    self.rounds << Round.create(ingredient: "Alligator", episode: self)
    self.rounds << Round.create(ingredient: "Mint", episode: self)
  end
end