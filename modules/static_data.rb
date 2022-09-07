require_relative '../models/source'
require_relative '../models/genre'
module StaticData
  def self.sources
    ['From a friend', 'Online shop'].map { |source| Source.new(source) }
  end

  def self.genres
    %w[Comedy Thriller].map { |genre| Genre.new(genre) }
  end

  def self.labels
    %w[Gift New]
  end

  def self.authors
    ['Stephen King', 'J K Rowling']
  end
end
