require_relative '../modules/file_handle'
require_relative '../models/music_album'

class MusicController
  include HandleFiles

  def list
    HandleFiles.read('musics.json').map do |music|
      obj = MusicAlbum.new(music['album'], music['genres'], music['genre_name'])
      obj
    end
  end

  def save(musics)
    save_obj = musics.map do |album|
      { id: album.id, genre: album.genre.name, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
    HandleFiles.write('musics.json', save_obj)
  end
end
