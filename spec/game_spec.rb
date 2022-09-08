require_relative '../models/game'

describe 'Game' do
  before :each do
    @game = Game.new('GTA', true, '07-09-2022')
  end

  describe 'instance of Game' do
    it 'should be a Game' do
      expect(@game).to be_instance_of(Game)
    end

    it 'should initialize with id' do
      expect(@game.id.nil?).to be_falsy
    end
  end

  describe 'Test for Game' do
    it 'should be the name' do
      expect(@game.name).to eq 'GTA'
    end

    it 'should be the last played' do
      expect(@game.last_played).to eq '07-09-2022'
    end

    it 'should be the multiplayer' do
      expect(@game.multiplayer).to eq true
    end
  end
end
