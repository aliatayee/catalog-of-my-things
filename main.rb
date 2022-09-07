require_relative 'modules/options'
require_relative 'modules/app'
require_relative 'controllers/movie'
require_relative 'controllers/book'
require_relative 'controllers/label'
require_relative 'controllers/music'

MOVIE_CONTROLLER = MovieController.new
MUSIC_CONTROLLER = MusicController.new
BOOK_CONTROLLER = BookController.new
LABEL_CONTROLLER = LabelController.new

puts 'Welcome Catalog of my things'

def main(app)
  puts "\n\nPlease choose an option by entering a number:"
  input = nil

  while input != 13
    Options.list_options
    input = App.take_input(Options::MAIN_RANGE)
    app.perform_main_operation(input)
  end

  app.save_data
  puts "\nThank You For Using Catalog App!"
end

app = App::INIT.new

main(app)
