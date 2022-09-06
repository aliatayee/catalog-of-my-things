require_relative 'modules/options'
require_relative 'modules/app'
require_relative 'controllers/movie'

MOVIE_CONTROLLER = MovieController.new

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
