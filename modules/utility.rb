require_relative '../models/movie'
require_relative '../models/game'
require_relative '../models/music_album'

module Utility
  def self.create_movies
    print 'Movie Name: '
    name = gets.strip.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    print 'Is it a Silent Movie? Y/N: '
    silent_inp = gets.strip.chomp.downcase
    silent = %w[y yes].include?(silent_inp)

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
    multiplayer_inp = gets.strip.chomp.downcase
    multiplayer = %w[y yes].include?(multiplayer_inp)

    Game.new(name, multiplayer, last_played)
  end

  def self.list_games(games)
    return puts 'No games listed yet' if games.count.zero?

    puts 'Game List:'
    games.each.with_index(1) do |game, i|
      print "\n#{i}) Name: #{game.name}, Is Multiplayer: #{game.multiplayer == true ? 'Yes' : 'No'}, "
      puts "Last Played: #{game.last_played}"
    end
  end

  def self.create_music_album
    print 'Album Name: '
    name = gets.strip.chomp

    puts 'Date of publish [Enter date in format (yyyy-mm-dd)]'
    publish_date = gets.chomp

    print 'Album On Spotify? Y/N: '
    spotify_inp = gets.strip.chomp.downcase
    on_spotify = %w[y yes].include?(spotify_inp)

    MusicAlbum.new(name, publish_date, on_spotify)
  end

  def self.list_music_albums(musics)
    return puts 'No music album listed yet' if musics.count.zero?

    puts 'Music List:'
    musics.each.with_index(1) do |music, i|
      print "\n#{i}) Name: #{music.name}, On Spotify: #{music.on_spotify == true ? 'Yes' : 'No'}, "
      puts "Publish Date: #{music.publish_date}"
    end
  end
end
