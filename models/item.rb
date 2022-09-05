class Item
  attr_reader :genre

  attr_accessor :publish_date

  def initialize(id, publish_date, archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived
  end

  def genre=(genre)
    @genre = genre
    genre.add_item(self) unless @genre.items.include?(self)
  end
end
