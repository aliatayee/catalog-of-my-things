require_relative '../models/source'

module StaticData
  def self.sources
    sources = []
    ['From a friend', 'Online shop'].each do |source|
      sources << Source.new(source)
    end
    sources
  end

  def self.genres
    %w[Comedy Thriller]
  end

  def self.labels
    %w[Gift New]
  end

  def self.authors
    ['Stephen King', 'J K Rowling']
  end
end
