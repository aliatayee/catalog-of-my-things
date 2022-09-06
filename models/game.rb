require 'item'

class Game < Item
  attr_accessor :name, :last_played, :multiplayer

  def initialize(name, last_played, multiplayer, id: nil, archived: false)
    super(id: id, publish_date: last_played, archived: archived)
    @name = name
    @last_played = last_played
    @multiplayer = multiplayer
  end

  private

  def can_be_archived?
    super || multiplayer
  end
end
