require_relative '../modules/file_handle'
require_relative '../models/genre'

class GenreController
  include HandleFiles

  def list
    HandleFiles.read('genre.json').map do |genre|
      obj = Genre.new(genre['id'], genre['name'])
      obj
    end
  end

  def save(genres)
    save_obj = genres.map do |genre|
      { id: genre.id, name: genre.name }
    end
    HandleFiles.write('genres.json', save_obj)
  end
end
