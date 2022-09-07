require_relative 'static_data'
require_relative 'options'
require_relative 'utility'

module App
  def self.take_input(range)
    input = gets.chomp
    return "\n'#{input}' is not a valid input.\nPlease try again" unless range.include?(input.to_i)

    input.to_i
  end

  class INIT
    attr_reader :books, :music_albums, :movies, :games

    def initialize
      @books = BOOK_CONTROLLER.load_books
      @music_albums = MUSIC_CONTROLLER.list
      @movies = MOVIE_CONTROLLER.list
      @games = GAME_CONTROLLER.list
      @genres = StaticData.genres
      @labels = LABEL_CONTROLLER.load_labels
      @authors = StaticData.authors
      @sources = StaticData.sources
    end

    def save_data
      # save @books, @music_albums, @games
      MOVIE_CONTROLLER.save(@movies)
      BOOK_CONTROLLER.save_books
      LABEL_CONTROLLER.save_labels
      GAME_CONTROLLER.save(@games)
      MUSIC_CONTROLLER.save(@music_albums)
    end

    def perform_main_operation(input)
      case input

      when 1..8
        handle_list_inputs(input)
      when 9
        @books << BOOK_CONTROLLER.add_book
      when 10
        @music_albums << Utility.create_music_album
        puts 'Music Album created successfully'
      when 11
        @movies << Utility.create_movies
        puts 'Movie created successfully'
      when 12
        @games << Utility.create_games
        puts 'Game created successfully'
      else
        puts input
      end
    end

    private

    def handle_list_inputs(input)
      case input.to_i

      when 1
        BOOK_CONTROLLER.list_all_books
      when 2
        puts "\nList @music_albums"
      when 3
        Utility.list_movies(@movies)
      when 4
        Utility.list_games(@games)
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
        LABEL_CONTROLLER.select_label
      when 7
        puts "\nAvailable Authors are"
        Options.list_data @authors
      when 8
        Options.list_sources @sources
      end
    end
  end
end
