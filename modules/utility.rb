require_relative '../models/movie'

module Utility
  def self.create_movies
    print 'Movie Name: '
    name = gets.strip.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    print 'Is it a Silent Movie? Y/N: '
    silent = gets.strip.chomp.downcase == 'y'

    Movie.new(name, silent, publish_date)
  end

  def self.list_movies(movies)
    return puts 'No movies listed yet' if movies.count.zero?

    puts 'Movie List:'
    movies.each.with_index(1) do |movie, i|
      puts "\n#{i}) Name: #{movie.name}, Is Silent: #{movie.silent == true ? 'Yes' : 'No'}, "
      print "Publish Date: #{movie.publish_date}"
    end
  end
end
