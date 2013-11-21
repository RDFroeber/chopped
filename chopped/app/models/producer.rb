class Producer
  def initialize(episode)
    @ep = episode
  end

  attr_reader :ep

  def brainstorm_rounds
    if ep.rounds.count == 1 || ep.rounds.count == 2
      raise "Stop that. You must have three rounds."
    elsif ep.rounds.count == 3 
      raise "You already have three rounds."
    elsif ep.rounds.count > 3   
      raise "You cannot have more than three rounds."
    else
      script_rounds
    end
  end

  def research_judges
    if ep.judges.count == 1 || ep.judges.count == 2
      raise "Stop that. You must have three judges."
    elsif ep.judges.count == 3 
      raise "You already have three judges."
    elsif ep.judges.count > 3   
      raise "You cannot have more than three judges."
    else
      hire_judges
    end
  end

  private
  
  def script_rounds
    ep.rounds << Round.create(ingredient: "Paprika", episode: ep)
    ep.rounds << Round.create(ingredient: "Alligator", episode: ep)
    ep.rounds << Round.create(ingredient: "Mint", episode: ep)
  end

  def hire_judges
    ep.judges << Judge.create(name: "Alfredo", episode: ep)
    ep.judges << Judge.create(name: "Marinara", episode: ep)
    ep.judges << Judge.create(name: "Vodka", episode: ep)
  end
end