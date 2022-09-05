# rubocop:disable Metrics/MethodLength
# rubocop:disable Metrics/CyclomaticComplexity

module App
  class INIT
    attr_reader :books, :music_albums, :movies, :games

    def initialize
      @books = []
      @music_albums = []
      @movies = []
      @games = []
    end

    def save_data
      # save @books, @music_albums
      # @movies, @games
    end

    def perform_main_operation(input)
      case input
        
      when 1
        puts "\nList @books"

      when 2
        puts "\nList @music_albums"
      when 3
        puts "\nList @movies"
      when 4
        puts "\nList @games"
      when 5
        puts "\nList all genres"
      when 6
        puts "\nList all labels"
      when 7
        puts "\nList all authors"
      when 8
        puts "\nList all sources"
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
  end

  def self.take_input(range)
    input = gets.chomp
    return "\n'#{input}' is not a valid input.\nPlease try again" unless range.include?(input.to_i)

    input.to_i
  end
end

# rubocop:enable Metrics/MethodLength
# rubocop:enable Metrics/CyclomaticComplexity
