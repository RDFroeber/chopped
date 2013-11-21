class Episode < ActiveRecord::Base
  validates :title, presence: true

  has_many :rounds
  has_many :judges

  after_save :check_rounds, :check_judges

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

  def check_judges
    if self.judges.count == 1 || self.judges.count == 2
      raise "Stop that. You must have three judges."
    elsif self.judges.count == 3 
      raise "You already have three judges."
    elsif self.judges.count > 3   
      raise "You cannot have more than three judges."
    else
      create_judges
    end
  end

  private
  
  def create_rounds
    self.rounds << Round.create(ingredient: "Paprika", episode: self)
    self.rounds << Round.create(ingredient: "Alligator", episode: self)
    self.rounds << Round.create(ingredient: "Mint", episode: self)
  end

  def create_judges
    self.judges << Judge.create(name: "Alfredo", episode: self)
    self.judges << Judge.create(name: "Marinara", episode: self)
    self.judges << Judge.create(name: "Vodka", episode: self)
  end
end