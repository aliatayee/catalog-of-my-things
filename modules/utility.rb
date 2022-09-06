require_relative '../models/movie'
require_relative '../models/game'

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
      print "\n#{i}) Name: #{movie.name}, Is Silent: #{movie.silent == true ? 'Yes' : 'No'}, "
      puts "Publish Date: #{movie.publish_date}"
    end
  end

  def self.create_games
    print 'Game Name: '
    name = gets.strip.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    last_played = gets.chomp

    print 'Is it a multiplayer Game? Y/N: '
    multiplayer = gets.strip.chomp.downcase == 'y'

    Game.new(name, last_played, multiplayer)
  end

  def self.list_games(games)
    return puts 'No games listed yet' if games.count.zero?

    puts 'Game List:'
    games.each.with_index(1) do |game, i|
      print "\n#{i}) Name: #{game.name}, Is Multiplayer: #{game.multiplayer == true ? 'Yes' : 'No'}, "
      puts "Last Played: #{game.last_played}"
    end
  end

end
