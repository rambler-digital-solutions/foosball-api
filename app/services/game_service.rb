class GameService
  def initialize(params)
    @params = params
  end

  def create!
    Game.create!(@params)
  end
end
