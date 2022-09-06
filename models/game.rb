require_relative 'item'

class Game < Item
  attr_accessor :name, :last_played, :multiplayer

  def initialize(name, last_played, multiplayer: true, id: nil, archived: false)
    super(id: id, publish_date: last_played, archived: archived)
    @name = name
    @last_played = last_played
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    super && Date.today.year - Date.parse(@last_played).year > 2
  end
end
