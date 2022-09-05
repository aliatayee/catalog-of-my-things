module Options
  MAIN_RANGE = (1..13).freeze

  def self.list_options
    puts "\n"
    puts '1 - List all books'
    puts '2 - List all music albums'
    puts '3 - List all movies'
    puts '4 - List of games'
    puts '5 - List all genres (e.g \'Comedy\', \'Thriller\')'
    puts '6 - List all labels (e.g. \'Gift\', \'New\')'
    puts '7 - List all authors (e.g. \'Stephen King\')'
    puts '8 - List all sources (e.g. \'From a friend\', \'Online shop\')'
    puts '9 - Add a book'
    puts '10 - Add a music album'
    puts '11 - Add a movie'
    puts '12 - Add a game'
    puts '13 - Quit'
  end

  def list_genres
    puts "\nSelect One From The List"
    puts '1 - Comedy'
    puts '2- Thriller'
  end

  def list_lables
    puts "\nSelect One From The List"
    puts '1 - Gist'
    puts '2 - New'
  end

  def list_sources
    puts "\nSelect One From The List"
    puts '1 - From a friend'
    puts '2 - Online shop'
  end

  def list_authors
    puts "\nSelect One From The List"
    puts '1 - Stephen Kin'
    puts '2 - J. K. Rowling'
  end
end
