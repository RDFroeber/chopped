class Episode < ActiveRecord::Base
  validates :title, presence: true

  has_many :rounds

  after_save :check_rounds
  # after_save :create_rounds,  if: Proc.new { |ep| self.rounds.count == 0 }

  def check_rounds
    if self.rounds.count == 1 || self.rounds.count == 2
      raise "Stop that. You must have three rounds."
    elsif self.rounds.count == 3 
      raise "You already have three rounds."
    elsif self.rounds.count > 3   
      raise "You cannot have more than three rounds."
    else
      create_rounds
    end
  end

  def create_rounds
    self.rounds << Round.create(ingredient: "Paprika", episode: self)
    self.rounds << Round.create(ingredient: "Alligator", episode: self)
    self.rounds << Round.create(ingredient: "Mint", episode: self)
  end
end