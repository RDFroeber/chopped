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

  def find_chefs
    if ep.chefs.count != 0 && ep.chefs.count < 4
      raise "Stop that. You must have four chefs."
    elsif ep.chefs.count == 4 
      raise "You already have four chefs."
    elsif ep.chefs.count > 4   
      raise "You cannot have more than four chefs."
    else
      hire_chefs
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

  def hire_chefs
    ep.chefs << Chef.create(name: "Giada De Laurentiis", episode: ep)
    ep.chefs << Chef.create(name: "Guy Fier", episode: ep)
    ep.chefs << Chef.create(name: "Julia Child", episode: ep)
    ep.chefs << Chef.create(name: "Ree Drummond", episode: ep)
  end
end