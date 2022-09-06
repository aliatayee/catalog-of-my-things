require_relative 'item'

class Movie < Item
  attr_accessor :silent, :name

  def initialize(title, silent, publish_date)
    super(nil, publish_date)
    @silent = silent
    @title = title
  end

  private

  def can_be_archived?
    super || silent
  end
end
