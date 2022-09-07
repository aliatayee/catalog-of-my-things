require_relative './item'

class MusicAlbum < Item
  attr_reader :name

  attr_accessor :on_spotify

  def initialize(name, publish_date, on_spotify, id = nil)
    super(id, publish_date)
    @name = name
    @on_spotify = on_spotify
  end

  private

  def can_be_archived?
    super && @on_spotify
  end
end
