require_relative 'static_data'
require_relative 'options'

module App
  def self.take_input(range)
    input = gets.chomp
    return "\n'#{input}' is not a valid input.\nPlease try again" unless range.include?(input.to_i)

    input.to_i
  end

  class INIT
    attr_reader :books, :music_albums, :movies, :games

    def initialize
      @books = []
      @music_albums = []
      @movies = []
      @games = []
      @genres = StaticData.genres
      @labels = StaticData.labels
      @authors = StaticData.authors
      @sources = StaticData.sources
    end

    def save_data
      # save @books, @music_albums
      # @movies, @games
    end

    def perform_main_operation(input)
      case input

      when 1..8
        handle_list_inputs(input)
      when 9
        puts "\nAdd @Book"
      when 10
        puts "\nAdd @music album"
      when 11
        puts "\nAdd @movie"
      when 12
        puts "\nAdd @game"
      else
        puts input
      end
    end

    private

    def handle_list_inputs(input)
      case input.to_i

      when 1
        puts "\nList @books"
      when 2
        puts "\nList @music_albums"
      when 3
        puts "\nList @movies"
      when 4
        puts "\nList @games"
      when 5..8
        handle_static_list(input)
      end
    end

    def handle_static_list(input)
      case input
      when 5
        puts "\nAvailable Genres are"
        Options.list_data @genres
      when 6
        puts "\nAvailable Labels are"
        Options.list_data @labels
      when 7
        puts "\nAvailable Authors are"
        Options.list_data @authors
      when 8
        puts "\nAvailable Sources are"
        Options.list_data @sources
      end
    end
  end
end
