require_relative '../modules/file_handle'
require_relative '../models/music_album'

class MusicController
  include HandleFiles

  def list
    HandleFiles.read('musics.json').map do |music|
      MusicAlbum.new(music['name'], music['publish_date'], music['on_spotify'], music['id'])
    end
  end

  def save(musics)
    save_obj = musics.map do |album|
      { id: album.id, name: album.name, publish_date: album.publish_date, on_spotify: album.on_spotify }
    end
    HandleFiles.write('musics.json', save_obj)
  end
end
