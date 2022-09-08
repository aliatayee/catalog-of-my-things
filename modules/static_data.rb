require_relative '../models/source'
require_relative '../models/author'
require_relative '../models/genre'

module StaticData
  def self.sources
    ['From a friend', 'Online shop'].map { |source| Source.new(source) }
  end

  def self.genres
    %w[Comedy Thriller]
  end

  def self.labels
    %w[Gift New]
  end

  def self.authors
    Author.new('John', 'Doe')
  end
end
