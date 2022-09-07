require_relative '../modules/file_handle'
require_relative '../models/game'

class GameController
  include HandleFiles
  def list
    HandleFiles.read('games.json').map do |game|
      obj = Game.new(game['name'], game['multiplayer'], game['last_played'])
      obj
    end
  end

  def save(games)
    save_obj = games.map do |game|
      { id: game.id, name: game.name, multiplayer: game.multiplayer, last_played: game.last_played }
    end
    HandleFiles.write('games.json', save_obj)
  end
end
