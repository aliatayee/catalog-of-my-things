require 'date'

class Item
  attr_reader :id, :genre, :author, :source, :label, :archived

  attr_accessor :publish_date

  def initialize(id, publish_date, archived= false)
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
    label.add_item(self) unless @label.items.include?(self)
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  private

  def can_be_archived?
    published_date_formatted = Date.parse(@publish_date)
    date_diff = Date.today.year - published_date_formatted.year
    date_diff.to_i > 10
  end
end
