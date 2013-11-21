class Episode < ActiveRecord::Base
  validates :title, presence: true

  has_many :rounds

  after_save :create_rounds

  def create_rounds
    case self.rounds.count
    when 3
      raise "Stop that."
    when !0
      raise "Too many rounds."
    else
      self.rounds << Round.create(ingredient: "Paprika", episode: self)
      self.rounds << Round.create(ingredient: "Alligator", episode: self)
      self.rounds << Round.create(ingredient: "Mint", episode: self)
    end
  end
end