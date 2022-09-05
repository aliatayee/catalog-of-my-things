class Item
  attr_reader :genre, :author, :source, :label

  attr_accessor :publish_date

  def initialize(id, publish_date, archived: false)
    @id = id || Random.rand(1..1000)
    @publish_date = publish_date
    @archived = archived

    @genre = @author = @source = @label = nil
  end

  def add_genre(genre)
    @genre = genre
    genre.add_item(self) unless @genre.items.include?(self)
  end

  def add_author(author)
    @author = author
    author.add_item(self) unless @author.items.include?(self)
  end

  def add_source(source)
    @source = source
    source.add_item(self) unless @source.items.include?(self)
  end

  def add_label(label)
    @label = label
    genre.add_item(self) unless @genre.items.include?(self)
  end
end
