require_relative 'item'

class Game < Item
  attr_accessor :name, :multiplayer, :last_played

  def initialize(name, multiplayer, last_played, id: nil)
    super(id, last_played)
    @name = name
    @last_played = last_played
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    super && Date.today.year - Date.parse(@last_played).year > 2
  end
end
