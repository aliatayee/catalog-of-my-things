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
    [{first_name: 'John',  last_name: 'Doe'}, 
      {first_name: 'J K',  last_name: 'Rowling'}
    ].map { |author| Author.new(author[:first_name], author[:last_name]) }
  end
end
