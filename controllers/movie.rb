require_relative '../modules/file_handle'
require_relative '../models/movie'

class MovieController
  include HandleFiles

  def list
    HandleFiles.read('movies.json').map do |movie|
      obj = Movie.new(movie['name'], movie['silent'], movie['publish_date'], movie['id'])
      obj
    end
  end

  def save(movies)
    save_obj = movies.map do |movie|
      { id: movie.id, name: movie.name, silent: movie.silent, publish_date: movie.publish_date }
    end
    HandleFiles.write('movies.json', save_obj)
  end
end
